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

    ArgProc.cs - The command line argument processor

 */


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Hpgl2Gcode.Properties;
using System.Configuration;

namespace Hpgl2Gcode
{
    public class ArgProc
    {
        public ArgProc(string[] args)
        {
            _switches = new Dictionary<string, string>();
            _processArgs(args);
        }
        public ArgProc(string[] args, Dictionary<string, string> defaults)
        {
            _switches = defaults;
            _processArgs(args);
        }
        public ArgProc(string[] args, Settings settings)
        {
            _switches = new Dictionary<string, string>();
            foreach (SettingsProperty defaultArg in settings.Properties)
            {
                if (defaultArg.PropertyType == typeof(string))
                {
                    _switches.Add(defaultArg.Name, (string)settings[defaultArg.Name]);
                }
            }
            _processArgs(args);
        }
        private void _processArgs(string[] args)
        {
            _arguments = new List<string>();
            for (int i = 0; i < args.Length; i++)
            {
                if (args[i].StartsWith("/") || args[i].StartsWith("-"))
                {
                    if (args.Length > i + 1)
                    {
                        if (args[i + 1].StartsWith("/") || args[i + 1].StartsWith("-"))
                        {
                            if (!_switches.ContainsKey(args[i].Substring(1)))
                            {
                                _switches.Add(args[i].Substring(1), null);
                            }
                        }
                        else
                        {
                            if (_switches.ContainsKey(args[i].Substring(1)))
                            {
                                _switches[args[i].Substring(1)] = args[i + 1];
                            }
                            else
                            {
                                _switches.Add(args[i].Substring(1), args[i + 1]);
                            }
                            i++;
                        }
                    }
                }
                else
                {
                    _arguments.Add(args[i]);
                }
            }
        }
        public string this[int i]
        {
            get
            {
                if (this._arguments.Count > i)
                {
                    return this._arguments[i];
                }
                else
                {
                    return null;
                }
            }
        }

        public string this[string i]
        {
            get
            {
                if (this._switches.ContainsKey(i))
                {
                    return this._switches[i];
                }
                else
                {
                    return null;
                }
            }
        }
        public int ArgCount
        {
            get
            {
                return _arguments.Count;
            }
        }
        public Dictionary<string,string>.KeyCollection SwitchKeys
        {
            get
            {
                return _switches.Keys;
            }
        }
        public static bool GetBool(string value)
        {
            return (value.ToLower() == "yes" || value.ToLower() == "true" || value.ToLower() == "1");
        }
        private List<string> _arguments;
        private Dictionary<string, string> _switches;
    }
}
