using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.Net;

namespace IM
{
    [TypeConverter(typeof(DarwinbotsVersionConverter))]
    public class DarwinbotsVersion
    {
        public string Name;
        public int PopulationMemoryAddress;
        public int CpsMemoryAddress;
        public int MutRateMemoryAddress;
        public int VegePopulationMemoryAddress;
        public int SizeLeftMemoryAddress;
        public int SizeRightMemoryAddress;
        public int TotalCyclesMemoryAddress;

        public override bool Equals(object obj)
        {
            if (obj.GetType() == typeof(DarwinbotsVersion))
            {
                DarwinbotsVersion other = (DarwinbotsVersion)obj;
                if (other.Name == this.Name &&
                    other.PopulationMemoryAddress == this.PopulationMemoryAddress &&
                    other.MutRateMemoryAddress == this.MutRateMemoryAddress &&
                    other.SizeLeftMemoryAddress == this.SizeLeftMemoryAddress &&
                    other.SizeRightMemoryAddress == this.SizeRightMemoryAddress &&
                    other.VegePopulationMemoryAddress == this.VegePopulationMemoryAddress &&
                    other.TotalCyclesMemoryAddress == this.TotalCyclesMemoryAddress &&
                    other.CpsMemoryAddress == this.CpsMemoryAddress)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

        public override string ToString()
        {
            return Name;
        }

        public static DarwinbotsVersion DownloadAndParse(string number)
        {
            WebClient webClient = new WebClient();
            String dbvstring = webClient.DownloadString(@"http://www.darwinbots.com/FTP/DBVersions/" + number + ".txt");
            DarwinbotsVersion v = (DarwinbotsVersion)TypeDescriptor.GetConverter(typeof(DarwinbotsVersion)).ConvertFromString(dbvstring);
            return v;
        }

        public static List<DarwinbotsVersion> GetAllVersions()
        {
            var dbversions = new List<DarwinbotsVersion>();
            dbversions.Add(v24404);
            dbversions.Add(v24405);
            dbversions.Add(v24406);
            dbversions.Add(v24500);
            dbversions.Add(v24501);
            return dbversions;
        }

        public static DarwinbotsVersion v24404
        {
            get
            {
                return new DarwinbotsVersion
                {
                    Name = "Darwin2.44.04",
                    PopulationMemoryAddress = 0x0060329E,
                    CpsMemoryAddress = 0x005F5140,
                    MutRateMemoryAddress = 0x005FBDC8,
                    VegePopulationMemoryAddress = 0x0060354E,
                    SizeLeftMemoryAddress = 0x00602C4C,
                    SizeRightMemoryAddress = 0x00602C48,
                    TotalCyclesMemoryAddress = 0x005F513C
                };
            }
        }

        public static DarwinbotsVersion v24405
        {
            get
            {
                return new DarwinbotsVersion
                {
                    Name = "Darwin2.44.05",
                    PopulationMemoryAddress = 0x0060329E,
                    CpsMemoryAddress = 0x005F5140,
                    MutRateMemoryAddress = 0x005FBDC8,
                    VegePopulationMemoryAddress = 0x0060354E,
                    SizeLeftMemoryAddress = 0x00602C4C,
                    SizeRightMemoryAddress = 0x00602C48,
                    TotalCyclesMemoryAddress = 0x005F513C
                };
            }
        }

        public static DarwinbotsVersion v24406
        {
            get
            {
                return new DarwinbotsVersion
                {
                    Name = "Darwin2.44.06",
                    PopulationMemoryAddress = 0x0060329E,
                    CpsMemoryAddress = 0x005F5140,
                    MutRateMemoryAddress = 0x005FBDC8,
                    VegePopulationMemoryAddress = 0x0060354E,
                    SizeLeftMemoryAddress = 0x00602C4C,
                    SizeRightMemoryAddress = 0x00602C48,
                    TotalCyclesMemoryAddress = 0x005F513C
                };
            }
        }

        public static DarwinbotsVersion v24500
        {
            get
            {
                return new DarwinbotsVersion
                {
                    Name = "Darwin2.45.00",
                    PopulationMemoryAddress = 0x005FA1BC,
                    CpsMemoryAddress = 0x005EC0E4,
                    MutRateMemoryAddress = 0x005F2D6C,
                    VegePopulationMemoryAddress = 0x005EC252,
                    SizeLeftMemoryAddress = 0x005F9BEC,
                    SizeRightMemoryAddress = 0x005F2D44,
                    TotalCyclesMemoryAddress = 0x005EC0E0
                };
            }
        }

        public static DarwinbotsVersion v24501
        {
            get
            {
                return new DarwinbotsVersion
                {
                    Name = "Darwin2.45.01",
                    PopulationMemoryAddress = 0x005FA220,
                    CpsMemoryAddress = 0x005EC0E4,
                    MutRateMemoryAddress = 0x005F2D6C,
                    VegePopulationMemoryAddress = 0x005EC252,
                    SizeLeftMemoryAddress = 0x005F9BEC,
                    SizeRightMemoryAddress = 0x005F2D44,
                    TotalCyclesMemoryAddress = 0x005EC0E0
                };
            }
        }
    }
}
