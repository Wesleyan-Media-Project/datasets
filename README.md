# Wesleyan Media Project - datasets

Welcome! This repo contains datasets which are not easily replicable but which are needed as inputs to other repos that make up the CREATIVE project. Notably, some repositiories require television ad data, for which you must submit an application. A link to the site where this application can be completed is included under the introduction section of this repository. 

The Cross-platform Election Advertising Transparency Initiative (CREATIVE), is a jointly founded infrastructure project by Wesleyan Media Project [(WMP)](https://mediaproject.wesleyan.edu) and [Privacy Tech Lab](https://privacytechlab.org) at Wesleyan University in Connecticut. This program is funded by a National Science Foundation [grant](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2235006) to support making WMP’s work and data accessible to anyone. CREATIVE aims to provide cross-platform integration and standardization of digital advertising data related to federal elections by scraping or gaining access to digital ads themselves. (For more information on the CREATIVE project, click [here](https://www.creativewmp.com/)).


This repo is a part of the Data Processing category. The output of this repo can be utilized in

- [forum_digital_2022](https://github.com/Wesleyan-Media-Project/forum_digital_2022)
- [ad_goal_classifier](https://github.com/Wesleyan-Media-Project/ad_goal_classifier)
- [party_classifier](https://github.com/Wesleyan-Media-Project/party_classifier)
- [ad_tone](https://github.com/Wesleyan-Media-Project/ad_tone)
- [data-post-production](https://github.com/Wesleyan-Media-Project/data-post-production)
- [entity_linking_2022](https://github.com/Wesleyan-Media-Project/entity_linking_2022)
- [face_url_scraper_2022](https://github.com/Wesleyan-Media-Project/face_url_scraper_2022)
- [negativity](https://github.com/Wesleyan-Media-Project/negativity)
- [ABSA](https://github.com/Wesleyan-Media-Project/ABSA)
- [fb_2022](https://github.com/Wesleyan-Media-Project/fb_2022)
- [party_classifier_pdid](https://github.com/Wesleyan-Media-Project/party_classifier_pdid)
- [mask](https://github.com/Wesleyan-Media-Project/mask)
- [race_of_focus](https://github.com/Wesleyan-Media-Project/race_of_focus)
- [entity_linking](https://github.com/Wesleyan-Media-Project/entity_linking)
- [fb_2020](https://github.com/Wesleyan-Media-Project/fb_2020)
- [attack_like](https://github.com/Wesleyan-Media-Project/attack_like)

![A picture of the repo pipeline](CREATIVE_step2_032524.png)

## Table of Contents

- [Introduction](#introduction)

- [Objective](#objective)

- [Data](#data)

- [Thank you!](#thank-you)


## Introduction

This repository is meant as a place to store datasets whose creation isn't assumed to be replicable (but which are used as inputs to other things that are meant to be replicable from that point on). When you need to replicate the workflow of other repositories mentioned above, you can use the data in this repository as input. Some repositories utilize TV data, which is not included in this repository due to contractual restrictions. To access the raw TV datasets, users are required to apply directly. Visit http://mediaproject.wesleyan.edu/dataaccess/ and fill out the online request form to access the TV datasets.
## Objective

Each of our repos belongs to one or more of the following categories:

- Data Collection
- Data Processing
- Data Classification
- Compiled Final Data

This repo is part of the Data Processing section.

## Data

The data created by the scripts in this repo is mostly in CSV format.

The data in the folder `candidates` is mostly about the candidates' information.

- The data started with `wmpcand` is the candidate characteristics collected by WMP, where each candidate has its own unique identifier used by the WMP. The data `opponents_2022.R` contains information on political candidates and their opponents for an election held in 2022. Both `face_url_politician.csv` and `face_url_candidate.csv` contain candicates' face_url that can be used for face recognition.

- Some candidates have multiple fecids. `corrections_fecids.csv` exists to deal with this issue. For any fecid (first column), the second column specifies what it should be changed to. If a candidate had 3 fecids, and let's say the first one is the correct one, then they would simply have two rows, one with 2 -> 1, and one with 3 -> 1. The third column is purely cosmetic, just so it's easier to remember who is who.

The data in the folder `facebook` contains a range of datasets that are used in the Facebook ads collection. `asr_fb2022_0905_1108.csv` is the dataset for auto-speech recognition. It contains ads' unique id, location in the wesmedia server, SHA256 checksum for the video file, asr status, models, media types, etc.

The data in folder `people` contains information about the candidates collected by WMP who are involved in the ads. The datasets contain fields including the candidates' unique id: `wmpid`, their full name `full_name`, FEC identifiers for different years or campaign cycles `fecid_2020`, `fecid_2022a`,`fecid_2022b`, `fecid_2022old`, Date candidate was added to the WMP person-level file `dateadded_person`, etc.

The data in folder `wmp_entity_files` contains the entity files created by WMP. The datasets in this folder are divided into Google entity files and Facebook entity files.

## Thank You

<p align="center"><strong>We would like to thank our financial supporters!</strong></p><br>

<p align="center">This material is based upon work supported by the National Science Foundation under Grant Numbers 2235006, 2235007, and 2235008.</p>

<p align="center" style="display: flex; justify-content: center; align-items: center;">
  <a href="https://www.nsf.gov/awardsearch/showAward?AWD_ID=2235006">
    <img class="img-fluid" src="nsf.png" height="150px" alt="National Science Foundation Logo">
  </a>
</p>

<p align="center">The Cross-Platform Election Advertising Transparency Initiative (CREATIVE) is a joint infrastructure project of the Wesleyan Media Project and privacy-tech-lab at Wesleyan University in Connecticut.

<p align="center" style="display: flex; justify-content: center; align-items: center;">
  <a href="https://www.creativewmp.com/">
    <img class="img-fluid" src="CREATIVE_logo.png"  width="220px" alt="CREATIVE Logo">
  </a>
</p>

<p align="center" style="display: flex; justify-content: center; align-items: center;">
  <a href="https://mediaproject.wesleyan.edu/">
    <img src="wmp-logo.png" width="218px" height="100px" alt="Wesleyan Media Project logo">
  </a>
</p>

<p align="center" style="display: flex; justify-content: center; align-items: center;">
  <a href="https://privacytechlab.org/" style="margin-right: 20px;">
    <img src="./plt_logo.png" width="200px" alt="privacy-tech-lab logo">
  </a>
</p>
