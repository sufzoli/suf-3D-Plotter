/*
    HPGL2GCODE - HPGL to GCODE Converter for Marlin/GRBL based pen plotters
    Version 0.1 alpha
    Copyright (C) 2017 by SUF

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

    Program.cs - The main code

 */
 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Hpgl2Gcode.Properties;
using System.Configuration;
using System.IO;
using ExtensionMethodes;

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
             
            // test
            /*
            Console.WriteLine("Arguments:");
            for (int i = 0; i < arguments.ArgCount; i++)
            {
                Console.WriteLine("[" + i.ToString() + "] " + arguments[i]);
            }
            Console.WriteLine("Switches:");
            foreach (string switchKey in arguments.SwitchKeys)
            {
                Console.WriteLine("[" + switchKey + "] " + arguments[switchKey]);
            }
            */
            // end test



            double HpglPpmm = arguments["HpglPpmm"].ToDouble(); // Hpgl Points per mm
            //double Speed = arguments["Speed"].ToDouble();
            Cordinate CurrentXY;
            Cordinate CenterXY = new Cordinate(0, 0); ;
            double Angle;
            double Alpha;
            Cordinate XY = new Cordinate(0,0);
            double R;
            Cordinate IJ;
            string[] HpglParams;
            bool IsDrawing = false;

            Console.WriteLine("HPGL to GCODE Converter v0.1 alpha - Copyright (C) 2017 by SUF");
            Console.WriteLine("This program is free software: you can redistribute it and / or modify");
            Console.WriteLine("it under the terms of the GNU General Public License as published by");
            Console.WriteLine("the Free Software Foundation, either version 3 of the License, or");
            Console.WriteLine("any later version.");

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
                if(!ArgProc.GetBool(arguments["IgnoreSpeed"]))
                {
                    OutFile.WriteLine("G1 F" + arguments["Speed"]);
                }
                OutFile.WriteLine("G28 " + arguments["HomeAxes"]);
                CurrentXY = new Cordinate(0, 0);
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
                                    CurrentXY = DrawPoly(OutFile, HpglPpmm, HpglCommand.Substring(2).Trim(), false);
                                    break;
                                case "PD": // Pen Down
                                    OutFile.WriteLine(arguments["PenDown"]);
                                    IsDrawing = true;
                                    CurrentXY = DrawPoly(OutFile, HpglPpmm, HpglCommand.Substring(2).Trim(), true);
                                    break;
                                case "VS": // Velocity Set
                                    if (!ArgProc.GetBool(arguments["IgnoreVelocity"]))
                                    {
                                        OutFile.WriteLine("G1 F" + (HpglCommand.Substring(2).ToDouble() * arguments["VelocityScale"].ToDouble()).ToIString());
                                    }
                                    break;
                                case "IN": // Start
                                    break;
                                case "SP":
                                    break;
                                case "PA": // Position Absolute
                                    XY = CurrentXY;
                                    CurrentXY = DrawPoly(OutFile, HpglPpmm, HpglCommand.Substring(2).Trim(), IsDrawing);
                                    CurrentXY = XY;
                                    break;
                                case "CI":  // Circle
                                    // Parse radius
                                    R = HpglCommand.Substring(2).Trim().ToDouble() / HpglPpmm;
                                    // Move negative X by Radius to arrive to the arc
                                    OutFile.WriteLine("G0 X" + (CurrentXY.X - R).ToIString());
                                    // Pen down - there is no PD command before CI, it assume that you draw the circle
                                    OutFile.WriteLine(arguments["PenDown"]);
                                    IsDrawing = true;
                                    // Draw the circle
                                    OutFile.WriteLine("G2 I" + R.ToIString());
                                    CurrentXY.X -= R;
                                    break;
                                case "AA": // Arc Absolute
                                    // gather the parameters
                                    HpglParams = HpglCommand.Substring(2).Trim().Split(',');
                                    CenterXY.X = HpglParams[0].ToDouble() / HpglPpmm;
                                    CenterXY.Y = HpglParams[1].ToDouble() / HpglPpmm;
                                    Angle = HpglParams[2].ToDouble();
                                    // calculate the relative center point (I,J)
                                    IJ = CenterXY - CurrentXY;
                                    // calculate the radius (pythagorean theorem)
                                    R = Math.Sqrt(Math.Pow(IJ.X, 2) + Math.Pow(IJ.Y, 2));
                                    // calculate the angle between start point and the X axis
                                    Alpha = DegMath.Asin((CurrentXY.Y - CenterXY.Y) / R);
                                    // extend the -90 to 90 degree angle to -270 to 90
                                    if (CurrentXY.X < CenterXY.X)
                                    {
                                        Alpha = -180 - Alpha;
                                    }
                                    // calculate the arc end absolute cordinates
                                    XY.X = CenterXY.X + R * DegMath.Cos(Angle + Alpha);
                                    XY.Y = CenterXY.Y + R * DegMath.Sin(Angle + Alpha);
                                    // generate the gcode
                                    // the positive angles moves CCV, the negative angles move CV
                                    OutFile.WriteLine((Angle > 0 ? "G3 X" : "G2 X") + XY.XString + " Y" + XY.YString + " I" + IJ.XString + " J" + IJ.YString);
                                    // Save the cordinates
                                    CurrentXY = XY;
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
        public static Cordinate DrawPoly(StreamWriter OutFile, double HpglPpmm, string data, bool IsRapid)
        {
            string[] Cordinates;
            Cordinate XY = new Cordinate(0,0);
            if (data.Trim().Length > 0)
            {
                Cordinates = data.Trim().Split(',');
                if (Cordinates.Length > 0)
                {
                    for (int i = 0; i < Cordinates.Length; i += 2)
                    {
                        XY.X = Cordinates[i].ToDouble() / HpglPpmm;
                        XY.Y = Cordinates[i + 1].ToDouble() / HpglPpmm;
                        OutFile.WriteLine((IsRapid ? "G1" : "G0") + " X" + XY.XString + " Y" + XY.YString);
                    }
                }
            }
            return XY;
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
        public static Cordinate operator +(Cordinate a, Cordinate b)
        {
            return new Cordinate(a.X + b.X, a.Y + b.Y);
        }
        public static Cordinate operator -(Cordinate a, Cordinate b)
        {
            return new Cordinate(a.X - b.X, a.Y - b.Y);
        }
        public string XString
        {
            get
            {
                return X.ToIString();
            }
            set
            {
                X = value.ToDouble();
            }
        }
        public string YString
        {
            get
            {
                return Y.ToIString();
            }
            set
            {
                Y = value.ToDouble();
            }
        }
    }
}
