using System;
using System.IO;

namespace IM
{
    public class SimInfo
    {
        public class Species
        {
            public string Name;
            public int Population;
            public int Color;
        }

        public float Cps;
        public int FieldHeight;
        public float MutRate;
        public int NumberSpecies;
        public int Population;
        public int SimEnergy;
        public int TotalCycles;
        public int FieldWidth;
        public Species[] Bots;

        public static SimInfo ParseDbPop(string path)
        {
            SimInfo info = new SimInfo();
            var popStream = new FileStream(path, FileMode.Open, FileAccess.Read);
            
            using (var binary = new BinaryReader(popStream))
            {
                info.FieldWidth = binary.ReadInt32();
                info.FieldHeight = binary.ReadInt32();
                info.MutRate = binary.ReadSingle();
                info.Cps = binary.ReadSingle();
                info.TotalCycles = binary.ReadInt32();
                info.Population = binary.ReadInt16(); //really a short
                info.SimEnergy = binary.ReadInt32();

                while (!IsEnd(binary))
                {
                    binary.BaseStream.Position += 1;
                }

                info.NumberSpecies = binary.ReadInt16();
                info.Bots = new Species[info.NumberSpecies];
                for (int i = 0; i < info.NumberSpecies; i++)
                {
                    int speciesNameLength = binary.ReadInt16();
                    info.Bots[i].Name = binary.ReadChars(speciesNameLength).ToString();
                    info.Bots[i].Population = binary.ReadInt16();
                    info.Bots[i].Color = binary.ReadInt32();

                    while (!IsEnd(binary))
                    {
                        binary.BaseStream.Position += 1;
                    }
                }
                binary.Close();
            }
            return info;
        }

        private static bool IsEnd(BinaryReader binary)
        {
            long oldPos = binary.BaseStream.Position;
            byte fe = 254;
            byte[] next = binary.ReadBytes(3);
            binary.BaseStream.Position = oldPos;
            if (next[0] == fe && next[1] == fe && next[2] == fe)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

    }
}
