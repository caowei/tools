import paramiko
from scp import SCPClient
import logging_util
import ntpath

class SCPServer:

    def __init__(self, ip, port, username, password):

        self.sources = []
        self.ip = ip
        self.port = port
        self.username = username
        self.password = password
        self.status = 'NOT start.'

    def add_source_file(self, source_file):
        self.sources.append(source_file)


def createSSHClient(server, port, user, password):
    client = paramiko.SSHClient()
    client.load_system_host_keys()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(server, port, user, password)
    return client


def scp_copy(ssh_client, source_file, to_dir):

    scp = SCPClient(ssh_client.get_transport())

    scp.get(source_file, local_path=to_dir)

    scp.close()

def scp_files(scp_server, dest_dir):

    try:

        logging_util.log("Start connect to {0}:{1}".format(scp_server.ip, scp_server.port))
        ssh_client = createSSHClient(scp_server.ip, scp_server.port, scp_server.username, scp_server.password)
        logging_util.log("Successfully connected.")

        for file_name in scp_server.sources:
            dest_file = generate_file_name(file_name, dest_dir, scp_server.ip)
            logging_util.log("Start to copy file from {0}:{1} to {2}".format(scp_server.ip, file_name, dest_file))
            scp_copy(ssh_client, file_name, dest_file)
            logging_util.log("Completed copy file from {0}:{1} to {2}".format(scp_server.ip, file_name, dest_file))

        scp_server.status = "SCP file successful"

    except Exception as e:
        print(e)
        scp_server.status = "SCP Failed"


def generate_file_name(source, dest_dir, server_name):
    base_name = ntpath.basename(source)
    return ntpath.join(dest_dir, server_name + "_" + base_name)


if __name__ == "__main__":

    server = SCPServer('xxxx, 'xxxx', 'xxxx')
    server.add_source_file('/etc/hosts')
    server.add_source_file('/etc/passwd')

    scp_files(server, '')
