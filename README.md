# Getting and Cleaning Data Course Project

<p>The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.</p>

### Step 1 - Unload the source data

The source data can be downloaded into the current directory by runing the script called download_assignment_data.R. In your R enviroment, load it:

<pre><code>
source("download_assignment_data.R"")
</code></pre>

### Step 2 - Run the script for analyais

The R script called "run_analysis.R" does the following, as per the assignment requirements:

<li>Download dataset if it does not already exist in current working directory</li>
<li>Loads both training and test datasets, filtering for only those columns that contain a mean or standard deviation</li>
<li>Merges the two datasets</li>
<li>Loads activity and subject data for each dataset and merge the columns with the dataset</li>
<li>Load activity and feature data</li>
<li>Convert activity and subject columns into factors</li>
<li>Write the final tidy dataset that contains mean of each variable for each subject and activity</li>
<p> </p>
<p>In your R enviroment, run the script</p>

<pre><code>
source("run_analysis.R"")
</code></pre>

### Step 3 - Find the output file

<p>The end result is shown in the file <code>"final_tidy_data.txt".</code>
</p>

