# Spotify Random Query Generator
Welcome to the **Spotify Random Query Generator** project! This tool was designed to enhance the playback experience of your favorite Spotify playlists by providing a truly random song selection method.

## Table of Contents
- [Overview](#overview)
- [Motivation](#motivation)
- [Features](#features)
- [Usage](#usage)
- [License](#license)
- [Contributing](#contributing)
- [Acknowledgments](#acknowledgments)

## Overview
The Spotify Random Query Generator is a script that allows you to play songs randomly from a major Spotify playlist. Unlike Spotify's built-in shuffle feature, which can sometimes play the same songs repeatedly, this tool ensures a more diverse listening experience by randomly selecting songs based on their position in the playlist.

## Motivation
The motivation behind this project arose from the frustration of experiencing limited randomness in Spotify's shuffle feature. Despite having a large playlist, the same songs seemed to play frequently. This project was created to address that issue by providing a more reliable and varied randomization process.

## Features
- **Truly Random Song Selection**: Generate a random number and select the song at that position in the playlist.
- **Improved Playback Experience**: Add randomly selected songs to your Spotify playback queue.
- **Easy to Use**: Simple script with minimal configuration required.
- **Customizable**: Easily adapt the script to work with different playlists or to modify the randomization logic.

## Usage
- Copy the ```.env.example``` file as ```.env```
- Fill the ```.env``` file with your data from spotify dashboard and playlist info.
- Run the script in the makefile
  ```bash
    make queue
  ```

## License
This project is licensed under the MIT License.

## Contributing
Contributions are welcome! If you'd like to improve this project, please fork the repository and submit a pull request. Whether it's bug fixes, new features, or documentation improvements, your help is appreciated.

##Acknowledgments

- Thanks to the Spotify Web API for providing the tools to interact with Spotify playlists.
- Inspired by the need for a better randomization experience in music playback.
