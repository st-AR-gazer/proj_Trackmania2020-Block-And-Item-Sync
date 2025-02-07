# Trackmania2020 Blocks and Items Sync (Altered Nadeo | Altered Block and Item Surfaces)

Welcome to the **Trackmania2020 Blocks and Items Sync** project! 
This is a tool that allows you to automatically keep your Trackmania2020 blocks and items up to date with the latest versions, by syncing with the latest Blocks and Items directly from this GitHub repository. 
In this README I'll go through how to set everything up.

---

## 📜 Table of Contents

1. [What is Trackmania2020 Blocks and Items Sync?](#what-is-trackmania2020-blocks-and-items-sync)
2. [Repository Structure](#repository-structure)
3. [Prerequisites](#prerequisites)
4. [Installation Guide](#installation-guide)
    - [Step 1: Download Python](#step-1-download-python)
    - [Step 2: Download the Sync Script](#step-2-download-the-sync-script)
    - [Step 3: Setting Up the Sync Script](#step-3-setting-up-the-sync-script)
    - [Step 4: Running the Sync Script](#step-4-running-the-sync-script)
    - [Step 5: Automate the Sync Process](#step-5-automate-the-sync-process)
5. [How It Works](#how-it-works)
6. [Creating Custom Blocks](#creating-custom-blocks)
    - [Manual Approach](#manual-approach)
    - [Using the OpenPlanet Plugin](#using-the-openplanet-plugin)
7. [Contributing](#contributing)
8. [Troubleshooting](#troubleshooting)
9. [Frequently Asked Questions (FAQ)](#frequently-asked-questions-faq)
10. [License](#license)
11. [🛠️ Tools Used](#tools-used)

---

## What is Trackmania2020 Blocks and Items Sync?

**Trackmania2020 Blocks and Items Sync** is a tool designed to simplify the process of keeping your game's Blocks and Items up-to-date. 
Instead of manually downloading and installing new content, this tool automatically synchronizes the latest updates from our GitHub repository directly to your game. This ensures you always have access to the newest and most exciting content without any hassle.

---

## Repository Structure

Understanding the repository structure will help you navigate and utilize the resources effectively.

```
repo/
├── src/
│   ├─── sorting/
│   │   └─── block_sorting.py
│   ├─── sync/
│   │   └─── trackmania2020_block_item_sync_script.py
│   └── plugin/
│       └── [plugin files here]
├── data/
│   └── Altered_Nadeo/
│   │   └─── [Block Type]
├── README.md
└── LICENSE
```

[Add file explanations here]

---

## Prerequisites

Before you begin, ensure you have the following:

1. **Windows Operating System**: This guide is tailored for Windows users.
2. **Trackmania2020 Installed**: Make sure you have Trackmania2020 installed on your computer.
3. **Internet Connection**: Required to download updates from GitHub.
4. **Python Installed**: The sync script is written in Python. [Download Python](https://www.python.org/downloads/) and install it if you haven't already.

---

## Installation Guide

Follow these steps to set up the **Trackmania2020 Blocks and Items Sync** tool on your computer.

### Step 1: Download Python

1. **Visit the Python Download Page**:
    - Go to [python.org/downloads](https://www.python.org/downloads/).

2. **Download the Latest Version**:
    - Click on the **"Download Python"** button suitable for your Windows version.

3. **Run the Installer**:
    - Double-click the downloaded installer file.

4. **Customize Installation**:
    - **Important**: Check the box that says **"Add Python to PATH"** at the bottom of the installer window.

5. **Complete Installation**:
    - Click **"Install Now"** and follow the on-screen instructions.

![Python Installer](imgur_gif_goes_here)  
*Figure 1: Python Installer Window*

### Step 2: Download the Sync Script

1. **Access the Repository**:
    - Navigate to this file in this GitHub repository: [Trackmania2020-Blocks-And-Items](https://github.com/st-AR-gazer/Trackmania2020-Blocks-And-Items)
    - `src/sync/trackmania2020_block_item_sync_script.py`

2. **Download the File**:
    - Click on the **"Download Raw File"** button located at the top right of the file view.
    - This will download the file to your `Downloads` folder.
    - Choose a destination folder, e.g., `C:\TrackmaniaSync\src`, and ensure the file is saved as `downloadscript.py`.

3. **Move the file to a decent location**:
    - Choose a destination folder, e.g., `C:\TrackmaniaSync\`, and ensure the file is saved/moved to this location, and is saved as `trackmania2020_block_item_sync_script.py`.
  
![Download Script](aaaaaaaaaaaaaaaaa)  
*Figure 2: Downloading the Sync Script*

### Step 3: Setting Up the Sync Script

1. **Open Command Prompt**:
    - Press `Win + R`, type `cmd`, and press **Enter**.

2. **Navigate to the Sync Folder**:
    - If you saved the script to `C:\TrackmaniaSync\`, type:
      
      ```bash
      cd C:\TrackmaniaSync\
      ```
      
      and press **Enter**.

3. **Install Required Python Libraries**:
    - Run the following commands to install necessary libraries:
      
      ```bash
      pip install requests pywin32
      ```
      
      - **`requests`**: Handles HTTP requests to GitHub.
      - **`pywin32`**: Enables logging to the Windows Event Log.

![Install Libraries](aaaaaaaaaaaaaaaaaaaaa)  
*Figure 3: Installing Python Libraries*

### Step 4: Running the Sync Script

1. **Run the Script**:
    - In the Command Prompt, ensure you're in the `C:\TrackmaniaSync\` directory.
    - Execute the script by typing:
      
      ```bash
      python trackmania2020_block_item_sync_script.py
      ```
      
      and press **Enter**.

2. **Initial Synchronization**:
    - The script will check for your Trackmania installation folders (`Trackmania2020` or `Trackmania`).
    - It will then download the latest `Blocks` and `Items` from the repository and place them in the appropriate director(y|ies).

3. **Check the Event Log**:
    - Open **Event Viewer**:
        - Press `Win + R`, type `eventvwr.msc`, and press **Enter**.
    - Navigate to **Windows Logs** > **Application**.
    - Look for events with the **Source**: `TrackmaniaSyncScript` to verify that the synchronization was successful.

![Event Viewer](aaaaaaaaaaaaaaaaaaaaa)  
*Figure 4: Viewing Events in Event Viewer*

### Step 5: Automate the Sync Process

To ensure your Blocks and Items are always up-to-date without manual intervention, set up a scheduled task to run the script at system startup.

#### 📅 Configuring Task Scheduler to Run at Startup with Daily Limits

1. **Open Task Scheduler**:
    - Press `Win + R`, type `taskschd.msc`, and press **Enter**.
    - Alternatively, search for **Task Scheduler** in the Start menu.

2. **Create a New Task**:
    - In the **Task Scheduler** window, click on **"Create Task…"** in the **Actions** pane on the right.

3. **General Tab**:
    - **Name**: `Trackmania2020 Sync`
    - **Description**: `Automatically synchronizes Blocks and Items from GitHub at system startup, + at least 1 day between syncs.`
    - **Security Options**:
        - Check **"Run whether user is logged on or not"**.
        - Optionally, check **"Run with highest privileges"** if necessary.
    - **Configure for**: Select your operating system (e.g., Windows 10, Windows 11).

4. **Triggers Tab**:
    - Click **"New…"** to create a new trigger.
    - **Begin the task**: **At startup**.
    - **Settings**:
        - **Delay task for**: Optional (e.g., 1 minute) to allow the system to stabilize.
        - **Enabled**: **Checked**.
    - Click **"OK"** to add the trigger.
    
    *Note*: The script's internal logic ensures it runs only once every 24 hours, even if the computer restarts multiple times within that period.

5. **Actions Tab**:
    - Click **"New…"** to create a new action.
    - **Action**: **Start a program**.
    - **Program/script**: Enter the path to your Python executable, e.g., `C:\Program Files\Python312\python.exe`.
    - **Add arguments**: Enter the full path to your script, e.g., `C:\TrackmaniaSync\trackmania2020_block_item_sync_script.py`.
    - **Start in**: Enter the script's directory, e.g., `C:\TrackmaniaSync\`.
    - Click **"OK"** to add the action.

6. **Conditions Tab**:
    - **Power**:
        - **Start the task only if the computer is on AC power**: **Unchecked** (if you want it to run on battery).
        - **Wake the computer to run this task**: **Unchecked** (unless necessary).
    - Adjust other settings as needed.
    - Click **"OK"** to save the trigger.

7. **Settings Tab**:
    - **Allow task to be run on demand**: **Checked** (optional).
    - **Run task as soon as possible after a scheduled start is missed**: **Checked**.
    - **If the task fails, restart every**: Leave default or set as desired.
    - **Stop the task if it runs longer than**: Set an appropriate timeout (e.g., `1 hour`).
    - **If the running task does not end when requested, force it to stop**: **Checked**.
    - Click **"OK"** to save the task.

8. **Finalize the Task**:
    - If prompted, enter your user credentials to authorize the task.
    - The task is now set to run at every system startup.

![Task Scheduler](aaaaaaaaaaaaaaaaaaaa)  
*Figure 5: Setting Up a Scheduled Task*

---

## How It Works

1. **Script Execution**:
    - When the script runs, it checks for the existence of the `Trackmania2020` or `Trackmania` folders in your user profile directory.
    - If neither exists, it creates the `Trackmania2020` folder as the default.

2. **Fetching Data**:
    - The script connects to the GitHub repository and retrieves the latest content from the `Blocks` and `Items` directories.

3. **Synchronization**:
    - It downloads any new or updated files and places them directly into your local Trackmania directories.

4. **Logging**:
    - All actions and any errors encountered are logged to the Windows Event Log for easy monitoring.

5. **Run Frequency Control**:
    - The script records the last synchronization time in a file located at `%APPDATA%\TrackmaniaSync\last_run.txt`.
    - Before each run, it checks this timestamp to ensure that at least 24 hours have passed since the last synchronization, preventing multiple runs within the same day.

---

## Creating Custom Blocks

For this project I've also created a plugin that helps with making custom surface alterations of blocks, the .op file can be found in `src/plugin/trackmania2020_block_item_sync_plugin_utility.op`.

### Manual Approach

Follow these steps to create altered surface versions of Blocks using the Mesh Modeller:

1. **Clone the Repository**:
    - Open **Command Prompt**.
    - Navigate to a desired directory and clone the repository, make sure that it is cloned to `Trackmania2020/Blocks/` so that they appear in the editor:
    - I also recomend removing all other blocks from this directory (and placing them in a temporary storage folder) as it becomes much easier to edit blocks if there is only one to choose from.
    - For changes made to the block/item directories to apply, you have to restart your trackmania2020 instance.
      
      ```bash
      git clone https://github.com/st-AR-gazer/Trackmania2020-Blocks-And-Items.git
      ```
      
    - Navigate into the cloned repository:
      
      ```bash
      cd Trackmania2020-Blocks-And-Items
      ```

2. **Open the Mesh Modeller**:
    - Open the map editor, place the block you want to edit, and open the mesh modeller withe the 'Block to Block' item tool.

3. **Select the Geometry**:
    - Open the existing geometry of the block you wish to modify.
    - Select the **"Paint Bucket"** tool. This tool applies a surface to a selected area.

4. **Apply New Surface**:
    - **Select a Base**:
        - Use the **wood blocks** as a base for your new surface.
        - Select the `Wood` and then press `Ctrl + Q` to select all wood parts of the mesh.
    - **Apply Surface**:
        - Choose the new surface you want to apply from the surface palette.
        - Ensure you enable **Keep UVs** to maintain texture mapping.
    - **Handle Borders**:
        - If the new surface includes a colored border or border type, apply again, select the material, and then press `Ctrl + Q` to select all the border.
        - If a colored border version isn't available, use the same material to maintain consistency, if this is the case, remember to NOT use these blocks as a base in the future.

5. **Save Your Changes**:
    - After applying the new surfaces, save your modified block with the suffix `[BLOCKNAME]-(Heavy|Light)[TYPE]`.
    - Save the newly created block to a temporary folder of your choosing and use the sorting script in `src/sorting/block_sorting.py` to properly sort the files (or contact me to do it for you).

6. **Submit Your Custom Block**:
    - Commit your changes and push them to a new branch.
    - Create a **Pull Request** to propose adding your custom block to the main repository, and I'll add them when I have the time.

---

## Frequently Asked Questions (FAQ)

**Q1: Do I need to have Trackmania2020 installed before using this tool?**

- **A**: Yes, ensure that Trackmania2020 is installed on your computer. The script will locate the installation folders and synchronize the Blocks and Items accordingly.

**Q2: Can I run the script manually?**

- **A**: Absolutely! Navigate to the script's directory in Command Prompt and run:
  
  ```bash
  python trackmania2020_block_item_sync_script.py
  ```

**Q3: What if the script encounters an error?**

- **A**: Errors are logged to the Windows Event Log under the **Application** section with the source `TrackmaniaSyncScript`. Open **Event Viewer** to review any issues.

---

## License

This project is licensed under the [Unilisense License](the unilisense.license). Feel free to use, modify, and distribute it as per the terms of the license.

---

## 🛠️ Tools Used

- **Python**: A versatile programming language used to write the synchronization script.
- **GitHub API**: Enables the script to interact with the GitHub repository to fetch the latest Blocks and Items.
- **Windows Task Scheduler**: Automates the execution of the synchronization script at system startup.
- **Windows Event Log**: Logs synchronization activities and errors for easy monitoring.

---

And I would like to thank ChatGPT for writing 95% of this :xdd:
