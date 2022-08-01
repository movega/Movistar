# movistar+TechnicalTryout



## Goal of this project

The goal of this project is to measure your skills and architectural level with a simple task. Even if the task seems short and simple, make it as scalable as possible. We would like to reuse components for other projects. Unit testing is encouraged.


## What to do

We want to visualize the live contents of some channels.

Create a vertical list containing information about live channels currently playing. Channels must be ordered by Id.
Each element of the list should show:
- Its channel's name and own title.
- The current progress percentage with a progress bar.
- Its channel's logo.

For time calculations, use the given currentTime in the request's response.

When you tap on the program with the id "24677", the app should navigate to a detail view where the main info of said program will be shown. For the rest of them, an Error pop up should prompt, informing the user about an unknown issue.

## Requests

Live Channels ->  https://jsonkeeper.com/b/AXKN
24677 Detail -> https://jsonkeeper.com/b/TCA0

