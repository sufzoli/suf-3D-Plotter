using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Hpgl2Gcode.Properties;
using System.Configuration;
using System.IO;
using System.Globalization;

namespace Hpgl2Gcode
{
    class Program
    {
        static void Main(string[] args)
        {
            string InFileName = null;
            string OutFileName = null;
            string InLine;
            string[] HpglCommands;
            string HpglCode;
            StreamReader InFile;
            StreamWriter OutFile;

            Settings settings = new Settings();
            ArgProc arguments = new ArgProc(args, settings);

            double HpglPpmm = double.Parse(arguments["HpglPpmm"], CultureInfo.InvariantCulture.NumberFormat); // Hpgl Points per mm
            double Speed = double.Parse(arguments["Speed"], CultureInfo.InvariantCulture.NumberFormat);
            double CurrentX;
            double CurrentY;
            double CenterX;
            double CenterY;
            double Angle;
            double Alpha;
            double X;
            double Y;
            double R;
            double I;
            double J;
            string[] HpglParams;
            bool IsDrawing = false;

            /*
            Console.WriteLine("Arguments:");
            for(int i=0;i<arguments.ArgCount;i++)
            {
                Console.WriteLine("[" + i.ToString() + "] " + arguments[i]);
            }
            Console.WriteLine("Switches:");
            foreach(string switchKey in arguments.SwitchKeys)
            {
                Console.WriteLine("[" + switchKey + "] " + arguments[switchKey]);
            }
            */
            if (arguments.ArgCount == 2)
            {
                InFileName = arguments[0];
                OutFileName = arguments[1];
            }
            else
            {
                InFileName = arguments["Source"];
                OutFileName = arguments["Destination"];
            }
            if (InFileName != null && OutFileName != null)
            {
                InFile = new StreamReader(InFileName);
                OutFile = new StreamWriter(OutFileName);
                // Write header
                OutFile.WriteLine("G21");
                OutFile.WriteLine(arguments["PenUp"]);
                IsDrawing = false;
                OutFile.WriteLine("G28 " + arguments["HomeAxes"]);
                CurrentX = 0;
                CurrentY = 0;
                while (!InFile.EndOfStream)
                {
                    InLine = InFile.ReadLine();
                    HpglCommands = InLine.Split(';');
                    foreach (string HpglCommand in HpglCommands)
                    {
                        if (HpglCommand.Trim().Length > 1)
                        {
                            HpglCode = HpglCommand.Trim().Substring(0, 2);
                            switch (HpglCode)
                            {
                                case "PU":  // Pen Up
                                    OutFile.WriteLine(arguments["PenUp"]);
                                    IsDrawing = false;
                                    if (HpglCommand.Trim().Length > 2)
                                    {
                                        HpglParams = HpglCommand.Substring(2).Trim().Split(',');
                                        if (HpglParams.Length > 0)
                                        {
                                            Y = CurrentY;
                                            X = double.Parse(HpglParams[0], CultureInfo.InvariantCulture.NumberFormat) / HpglPpmm;
                                            if (HpglParams.Length > 1)
                                                Y = double.Parse(HpglParams[1], CultureInfo.InvariantCulture.NumberFormat) / HpglPpmm;
                                            OutFile.WriteLine("G0 X" + X.ToString(CultureInfo.InvariantCulture.NumberFormat) + " Y" + Y.ToString(CultureInfo.InvariantCulture.NumberFormat) + " F" + Speed.ToString(CultureInfo.InvariantCulture.NumberFormat));
                                            CurrentX = X;
                                            CurrentY = Y;
                                        }
                                    }
                                    break;
                                case "PD": // Pen Down
                                    OutFile.WriteLine(arguments["PenDown"]);
                                    IsDrawing = true;
                                    if (HpglCommand.Trim().Length > 2)
                                    {
                                        HpglParams = HpglCommand.Substring(2).Trim().Split(',');
                                        if (HpglParams.Length > 0)
                                        {
                                            X = CurrentX;
                                            Y = CurrentY;
                                            for (int i = 0; i < HpglParams.Length; i += 2)
                                            {
                                                X = double.Parse(HpglParams[i], CultureInfo.InvariantCulture.NumberFormat) / HpglPpmm;
                                                Y = double.Parse(HpglParams[i + 1], CultureInfo.InvariantCulture.NumberFormat) / HpglPpmm;
                                                OutFile.WriteLine("G1 X" + X.ToString(CultureInfo.InvariantCulture.NumberFormat) + " Y" + Y.ToString(CultureInfo.InvariantCulture.NumberFormat) + " F" + Speed.ToString(CultureInfo.InvariantCulture.NumberFormat));
                                            }
                                            CurrentX = X;
                                            CurrentY = Y;
                                        }
                                    }
                                    break;
                                case "VS": // Velocity Set
                                    if (!ArgProc.GetBool(arguments["IgnoreVelocity"]))
                                    {
                                        Speed = double.Parse(HpglCommand.Substring(2), CultureInfo.InstalledUICulture.NumberFormat) * double.Parse(arguments["VelocityScale"], CultureInfo.InstalledUICulture.NumberFormat);
                                    }
                                    break;
                                case "IN": // Start
                                    break;
                                case "SP":
                                    break;
                                case "PA": // Position Absolute
                                    X = CurrentX;
                                    Y = CurrentY;
                                    if (HpglCommand.Trim().Length > 2)
                                    {
                                        HpglParams = HpglCommand.Substring(2).Trim().Split(',');
                                        if (HpglParams.Length > 0)
                                            X = double.Parse(HpglParams[0], CultureInfo.InvariantCulture.NumberFormat) / HpglPpmm;
                                        if (HpglParams.Length > 1)
                                            Y = double.Parse(HpglParams[1], CultureInfo.InvariantCulture.NumberFormat) / HpglPpmm;
                                    }
                                    // if the pen is down draw (G1) if it is up rapid move (G0)
                                    OutFile.WriteLine((IsDrawing ? "G1" : "G0") + " X" + X.ToString(CultureInfo.InvariantCulture.NumberFormat) + " Y" + Y.ToString(CultureInfo.InvariantCulture.NumberFormat) + " F" + Speed.ToString(CultureInfo.InvariantCulture.NumberFormat));
                                    CurrentX = X;
                                    CurrentY = Y;
                                    break;
                                case "CI":  // Circle
                                    // Parse radius
                                    R = double.Parse(HpglCommand.Substring(2).Trim(), CultureInfo.InvariantCulture.NumberFormat) / HpglPpmm;
                                    // Move negative X by Radius to arrive to the arc
                                    OutFile.WriteLine("G0 X" + (CurrentX - R).ToString(CultureInfo.InvariantCulture.NumberFormat) + " F" + Speed.ToString(CultureInfo.InvariantCulture.NumberFormat));
                                    // Pen down - there is no PD command before CI, it assume that you draw the circle
                                    OutFile.WriteLine(arguments["PenDown"]);
                                    IsDrawing = true;
                                    // Draw the circle
                                    OutFile.WriteLine("G2 I" + R.ToString(CultureInfo.InvariantCulture.NumberFormat));
                                    CurrentX -= R;
                                    break;
                                case "AA": // Arc Absolute
                                    // gather the parameters
                                    HpglParams = HpglCommand.Substring(2).Trim().Split(',');
                                    CenterX = double.Parse(HpglParams[0], CultureInfo.InvariantCulture.NumberFormat) / HpglPpmm;
                                    CenterY = double.Parse(HpglParams[1], CultureInfo.InvariantCulture.NumberFormat) / HpglPpmm;
                                    Angle = double.Parse(HpglParams[2], CultureInfo.InvariantCulture.NumberFormat);
                                    // calculate the relative center point (I,J)
                                    I = CenterX - CurrentX;
                                    J = CenterY - CurrentY;
                                    // calculate the radius (pythagorean theorem)
                                    R = Math.Sqrt(Math.Pow(I, 2) + Math.Pow(J, 2));
                                    // calculate the angle between start point and the X axis
                                    Alpha = Math.Asin((CurrentY - CenterY) / R) * 180 / Math.PI;
                                    // extend the -90 to 90 degree angle to -270 to 90
                                    if (CurrentX < CenterX)
                                    {
                                        Alpha = -180 - Alpha;
                                    }
                                    // calculate the arc end absolute cordinates
                                    X = CenterX + R * Math.Cos((Angle + Alpha) * Math.PI / 180);
                                    Y = CenterY + R * Math.Sin((Angle + Alpha) * Math.PI / 180);
                                    // generate the gcode
                                    // the positive angles moves CCV, the negative angles move CV
                                    OutFile.WriteLine((Angle > 0 ? "G3 X" : "G2 X") + X.ToString(CultureInfo.InvariantCulture.NumberFormat) +
                                                        " Y" + Y.ToString(CultureInfo.InvariantCulture.NumberFormat) +
                                                        " I" + I.ToString(CultureInfo.InvariantCulture.NumberFormat) +
                                                        " J" + J.ToString(CultureInfo.InvariantCulture.NumberFormat)
                                        );
                                    // Save the cordinates
                                    CurrentX = X;
                                    CurrentY = Y;
                                    break;
                                default:
                                    // Unknown or unimplemented command arrived
                                    Console.WriteLine("Warrning: Unknown Command: " + HpglCommand);
                                    break;

                            }
                        }
                    }
                }
                OutFile.Flush();
                OutFile.Close();
                InFile.Close();
            }
            else
            {
                if (InFileName == null)
                {
                    Console.WriteLine("Command line error: Source file missing");
                }
                if (OutFileName == null)
                {
                    Console.WriteLine("Command line error: Destination file missing");
                }
            }
        }
        public static Cordinate DrawPoly(StreamWriter OutFile, double HpglPpmm, double Speed, string data, bool IsRapid)
        {
            string[] Cordinates;
            double X=0, Y=0;
            if (data.Trim().Length > 2)
            {
                Cordinates = data.Substring(2).Trim().Split(',');
                if (Cordinates.Length > 0)
                {
                    for (int i = 0; i < Cordinates.Length; i += 2)
                    {
                        X = double.Parse(Cordinates[i], CultureInfo.InvariantCulture.NumberFormat) / HpglPpmm;
                        Y = double.Parse(Cordinates[i + 1], CultureInfo.InvariantCulture.NumberFormat) / HpglPpmm;
                        OutFile.WriteLine((IsRapid ? "G1" : "G0") + " X" + X.ToString(CultureInfo.InvariantCulture.NumberFormat) + " Y" + Y.ToString(CultureInfo.InvariantCulture.NumberFormat) + " F" + Speed.ToString(CultureInfo.InvariantCulture.NumberFormat));
                    }
                }
            }
            return new Cordinate(X,Y);
        }
    }
    public class Cordinate
    {
        public Cordinate() { }
        public Cordinate(double X, double Y)
        {
            this.X = X;
            this.Y = Y;
        }
        public double X;
        public double Y;
    }
}
