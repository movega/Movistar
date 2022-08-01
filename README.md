# movistar+TechnicalTryout



## Goal of this project

The goal of this project is to measure your skills and architectural level with a simple task. Even if the task seems short and simple, make it as scalable as possible. We would like to reuse components for other projects. Unit testing is encouraged.


## Tasks

We want to visualize the live contents of some channels.

Create a vertical list containing information about live channels currently playing. Channels must be ordered by Id.
Each element of the list should show:
- Its channel's name and own title.
- The current progress percentage with a progress bar.
- Its channel's logo.

For time calculations, use the given currentTime in the request's response.

When you tap on the program with the id "24677", the app should navigate to a detail view where the main info of said program will be shown. For the rest of them, an Error pop up should prompt, informing the user about an unknown issue.

## Frameworks

If possible, we would like you to use UIKit and RxSwift since that's what we've been using until now. However, if you started developing with SwiftUI and Combine, we consider it a valid alternative to do this tryout. 
Apart from this, use whichever tool you deem necessary for the project.

## Requests

Live Channels ->  https://jsonkeeper.com/b/AXKN

24677 Detail -> https://jsonkeeper.com/b/TCA0

