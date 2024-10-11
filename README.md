# Ansible Project: Setting Up Build Machines with Docker and Maven

# Overview
This Ansible project is designed to simplify the setup of build machines by automating the installation of Docker and Maven. It focuses on code reuse, making it easier to deploy these essential tools on targeted machines. The project utilizes a dynamic inventory file and supports customization of software versions through extra variables.

- The project includes a roles folder with Docker and Maven directories, and the buildsetup.yml file is used to execute Maven binaries on the target machine. It also leverages a dynamic inventory file, which can be edited to specify the target machines. The Ansible playbook executes two tasks: setting up Docker and Maven on the targeted node, ensuring that the instances are ready with these essential tools installed. To use this project, simply clone the repository on the Ansible controller machine, make minor changes to the dynamic inventory file, and specify the required Maven and JDK versions if necessary.


# Key Features
- Dynamic Inventory: The project includes a dynamic inventory file that can be edited to specify the target machines for setup.
- Role-Based Structure: It follows a role-based structure with dedicated directories for Docker and Maven, promoting reusability.
- Customizable Versions: Users can customize the versions of Docker and Maven during execution using extra variables.

# Prerequisites
Before you begin, ensure you have met the following requirements:
- Ansible should be installed on the controller machine.
- SSH Access must be configured with the target machines, and the necessary PEM files should be available.

# Project Structure
```
/project-root
├── roles/
│   ├── docker/         # Role for setting up Docker
│   ├── maven/          # Role for setting up Maven
├── buildsetup.yml      # Ansible playbook for setting up the build machine
├── demohosts           # Dynamic inventory file
```

# Getting Started

# Step 1: Clone the Repository
Clone the repository containing all the Ansible files, including the dynamic inventory file `demohosts`:

```bash
git clone <repository_url>
cd Ansible-project
```

This step ensures you have the necessary playbooks, roles, and inventory files locally on your Ansible controller.

# Step 2: Add the Target Machine to Inventory
1. Edit the Dynamic Inventory File:
   Open the `demohosts` file to add your target machine’s details:

   ```bash
   vi demohosts
   ```

   Example of a host entry in `demohosts`:

   ```
   [demo]
   Buildserver ansible_host=<ip_address> ansible_user=ubuntu ansible_ssh_private_key_file=/etc/ansible/master.pem
   ```

2. Save the File:
   This setup allows Ansible to communicate with the target machine using SSH.

# Step 3: Execute the Playbook
Run the Ansible playbook with the following command, specifying the dynamic inventory file:

```bash
ansible-playbook buildsetup.yml -i /home/ubuntu/project/demohosts
```

This command applies the playbook to the target machine, setting up Maven, JDK, and Docker.

# Step 4: Passing Extra Variables
If you need to install a different version of Maven, pass the version number as an extra variable during playbook execution:

```bash
ansible-playbook buildsetup.yml -i /home/ubuntu/project/demohosts --extra-vars "maven_version=3.8.1"
```

This approach allows you to update software versions without modifying the playbook or role files.


# Understanding the Project Structure
- Playbooks: The `buildsetup.yml` playbook is responsible for setting up the target machine with Maven, JDK, and Docker.
- Roles: The `roles` directory contains reusable Ansible roles for setting up Docker and Maven.
- Inventory: The dynamic inventory file `demohosts` specifies the target machines and their connection details.

# Conclusion
By following these steps, you can easily configure a build machine to set up Maven, JDK, Git, and Docker. This project is designed to be flexible and user-friendly, allowing you to clone the repository, make minor adjustments, and start executing the Ansible playbook with minimal effort. Ansible makes automation simple and efficient!

