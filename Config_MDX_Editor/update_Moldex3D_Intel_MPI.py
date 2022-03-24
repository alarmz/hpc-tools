import os
from os import listdir
from os.path import isfile
"""
Moldex3D_Intel_MPI.conf
I_MPI_HYDRA_IFACE=ib0
"""

class search_Moldex3D_Intel_MPI_CFG:

    def __init__(self):
        self.working_folder = "/mnt/hpcfs/Moldex3D_Solver_Home/"
        pass

    def list_all_files(self):
        #FileLists = listdir(self.WorkingFolder)
        for (root, dirs, FileLists) in os.walk(self.working_folder):
            for aFile in FileLists:
                #print(aFile)
                FullFilePath = os.path.join(root, aFile)
                if isfile(FullFilePath) == False: continue
                if FullFilePath.lower().endswith("conf") != True: continue
                #print(FullFilePath)
                if ("Moldex3D_Intel_MPI.conf" in FullFilePath):
                    #print(FullFilePath)
                    oFile = open(FullFilePath, 'r')
                    ConfigString = oFile.read()
                    oFile.close()
                    if ("I_MPI_TCP_NETMASK=10.0.3.0/24" in ConfigString):continue
                    #ConfigString = ConfigString.replace("I_MPI_HYDRA_IFACE=", "I_MPI_HYDRA_IFACE=ib0")
                    ConfigString = ConfigString.replace("I_MPI_TCP_NETMASK=", "I_MPI_TCP_NETMASK=10.0.3.0/24")
                    ConfigString = ConfigString.replace("I_MPI_WAIT_MODE=", "I_MPI_WAIT_MODE=0")
                    ConfigString = ConfigString.replace("I_MPI_THREAD_YIELD=", "I_MPI_THREAD_YIELD=3")
                    oFile = open(FullFilePath, "w")
                    oFile.write(ConfigString)
                    oFile.close()
                    print(f"update {FullFilePath} wiht I_MPI_TCP_NETMASK=10.0.3.0/24...done")
                    #print(FullFilePath)
                    pass
        pass



def main():
    update_ib0 = search_Moldex3D_Intel_MPI_CFG()
    update_ib0.list_all_files()


if __name__ == "__main__":
    main()
