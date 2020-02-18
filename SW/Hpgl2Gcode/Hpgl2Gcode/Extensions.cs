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

    Extensions.cs - Class definitions and extensions for mathematical and converssion classes

 */



using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;

namespace ExtensionMethodes
{
    public static class Extensions
    {
        public static string ToIString(this double value)
        {
            return value.ToString(CultureInfo.InvariantCulture.NumberFormat);
        }
        public static double ToDouble(this string value)
        {
            return double.Parse(value, CultureInfo.InvariantCulture.NumberFormat);
        }
    }
    public static class DegMath
    {
        public static double Sin(double angle) { return Math.Sin(angle * Math.PI / 180); }
        public static double Cos(double angle) { return Math.Cos(angle * Math.PI / 180); }
        public static double Tan(double angle) { return Math.Tan(angle * Math.PI / 180); }
        public static double Asin(double value) { return Math.Asin(value) * 180 / Math.PI; }
        public static double Acos(double value) { return Math.Acos(value) * 180 / Math.PI; }
        public static double Atan(double value) { return Math.Atan(value) * 180 / Math.PI; }
    }
}
