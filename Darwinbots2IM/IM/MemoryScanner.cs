using System;
using System.Linq;
using System.Text;
using System.Collections;
using System.Runtime.InteropServices;

namespace IM
{
    public static class MemoryScanner
    {
        #region WinAPI Imports
        [DllImport("kernel32.dll")]
        private static extern IntPtr OpenProcess(
            uint dwDesiredAccess,
            [MarshalAs(UnmanagedType.Bool)] bool bInheritHandle,
            int dwProcessId
        );

        [DllImport("kernel32.dll")]
        private static extern bool ReadProcessMemory(
            IntPtr hProcess,
            IntPtr lpBaseAddress,
            [Out()] byte[] lpBuffer,
            int dwSize,
            out int lpNumberOfBytesRead
        );

        [DllImport("kernel32.dll")]
        private static extern Int32 CloseHandle
        (
            IntPtr hObject
        );
        #endregion

        public static byte[] ReadMemory(IntPtr process, IntPtr MemoryAddress, int bytesToRead, out int bytesRead)
        {
            byte[] buffer = new byte[bytesToRead];
            ReadProcessMemory(process, MemoryAddress, buffer, bytesToRead, out bytesRead);
            return buffer;
        }

        /// <summary>
        /// Scans a instance of Darwinbots' memory.
        /// This method's return value is not type safe, be careful.
        /// SimPop:uint|CPS:float|VegePop:uint|MutRate:float|Size:string|TotalCycles:uint
        /// </summary>
        /// <param name="dbv">DarwinbotsVersion to scan</param>
        /// <param name="pid">The processID we want to scan</param>
        /// <returns>
        /// A Hastable with the following format:
        /// string : var
        /// ------------------
        /// SimPop : uint
        /// CPS : float
        /// VegePop : uint
        /// MutRate : float
        /// Size : string
        /// TotalCycles : uint
        /// </returns>
        public static Hashtable ScanDarwinbots(DarwinbotsVersion dbv, int pid)
        {
            var ht = new Hashtable();

            uint simpop;
            float cps;
            uint vegpop;
            float mutrate;
            string size;
            uint totalCycles;

            #region scaning
            int bytes = 0;
            //Get a process handle
            //0x10 == PROCESS_VM_READ
            IntPtr process = OpenProcess(0x00000010, false, pid);
            //Read the memory addresses
            simpop = BitConverter.ToUInt16(ReadMemory(process, new IntPtr(dbv.PopulationMemoryAddress), 2, out bytes), 0);
            bytes = 0;
            cps = BitConverter.ToSingle(ReadMemory(process, new IntPtr(dbv.CpsMemoryAddress), 4, out bytes), 0);
            bytes = 0;
            mutrate = BitConverter.ToSingle(ReadMemory(process, new IntPtr(dbv.MutRateMemoryAddress), 4, out bytes), 0);
            bytes = 0;
            vegpop = BitConverter.ToUInt16(ReadMemory(process, new IntPtr(dbv.VegePopulationMemoryAddress), 2, out bytes), 0);
            bytes = 0;
            size = BitConverter.ToUInt32(ReadMemory(process, new IntPtr(dbv.SizeLeftMemoryAddress), 4, out bytes), 0).ToString() + 'x' + BitConverter.ToUInt32(ReadMemory(process, new IntPtr(dbv.SizeRightMemoryAddress), 4, out bytes), 0).ToString();
            bytes = 0;
            totalCycles = System.BitConverter.ToUInt32(ReadMemory(process, new IntPtr(dbv.TotalCyclesMemoryAddress), 4, out bytes), 0);
            //Close our process handle
            CloseHandle(process);
            #endregion

            ht.Add("SimPop", simpop);
            ht.Add("CPS", cps);
            ht.Add("VegePop", vegpop);
            ht.Add("MutRate", mutrate);
            ht.Add("Size", size);
            ht.Add("TotalCycles", totalCycles);

            return ht;
        }
    }
}
