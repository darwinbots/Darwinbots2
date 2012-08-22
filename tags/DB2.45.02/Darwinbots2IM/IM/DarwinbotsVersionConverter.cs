using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.Globalization;
using System.Collections.Specialized;

namespace IM
{
    public class DarwinbotsVersionConverter : TypeConverter
    {
        public override bool CanConvertFrom(ITypeDescriptorContext context, Type sourceType)
        {
            if (sourceType == typeof(string))
            {
                return true;
            }
            return base.CanConvertFrom(context, sourceType);
        }

        public override bool CanConvertTo(ITypeDescriptorContext context, Type destinationType)
        {
            if(destinationType == typeof(DarwinbotsVersion))
            {
                return true;
            }
            return base.CanConvertTo(context, destinationType);
        }

        public override object ConvertFrom(ITypeDescriptorContext context, CultureInfo culture, object value)
        {
            if (value is string)
            {
                DarwinbotsVersion dbVersion = new DarwinbotsVersion();
                char[] newlines = { '\r', '\n' };
                string[] lines = ((string)value).Split(newlines, StringSplitOptions.RemoveEmptyEntries);
                NameValueCollection nvc = new NameValueCollection();
                foreach (string s in lines)
                {
                    string[] pair = s.Split('=');
                    nvc.Add(pair[0], pair[1]);
                }
                dbVersion.Name = nvc.Get("Name");
                dbVersion.PopulationMemoryAddress = Convert.ToInt32(nvc.Get("Population"), 16);
                dbVersion.CpsMemoryAddress = Convert.ToInt32(nvc.Get("Cps"), 16);
                dbVersion.MutRateMemoryAddress = Convert.ToInt32(nvc.Get("MutRate"), 16);
                dbVersion.VegePopulationMemoryAddress = Convert.ToInt32(nvc.Get("VegePopulation"), 16);
                dbVersion.SizeLeftMemoryAddress = Convert.ToInt32(nvc.Get("SizeLeft"), 16);
                dbVersion.SizeRightMemoryAddress = Convert.ToInt32(nvc.Get("SizeRight"), 16);
                dbVersion.TotalCyclesMemoryAddress = Convert.ToInt32(nvc.Get("TotalCycles"), 16);
                return dbVersion;
            }
            return base.ConvertFrom(context, culture, value);
        }

        // Overrides the ConvertTo method of TypeConverter.
        public override object ConvertTo(ITypeDescriptorContext context, CultureInfo culture, object value, Type destinationType)
        {
            if (destinationType == typeof(string))
            {
                StringBuilder versionString = new StringBuilder();
                DarwinbotsVersion dbv = (DarwinbotsVersion)value;
                versionString.AppendLine("Name=" + dbv.Name);
                versionString.AppendLine("Population=" + dbv.PopulationMemoryAddress.ToString("X"));
                versionString.AppendLine("Cps=" + dbv.CpsMemoryAddress.ToString("X"));
                versionString.AppendLine("MutRate=" + dbv.MutRateMemoryAddress.ToString("X"));
                versionString.AppendLine("VegePopulation=" + dbv.VegePopulationMemoryAddress.ToString("X"));
                versionString.AppendLine("SizeLeft=" + dbv.SizeLeftMemoryAddress.ToString("X"));
                versionString.AppendLine("SizeRight=" + dbv.SizeRightMemoryAddress.ToString("X"));
                versionString.AppendLine("TotalCycles=" + dbv.TotalCyclesMemoryAddress.ToString("X"));
                return versionString.ToString();
            }
            return base.ConvertTo(context, culture, value, destinationType);
        }
    }
}
