FitApp
Description
FitApp is a health and fitness Flutter application designed to help users track their physical and mental well-being through a combination of journaling and health metrics. The app integrates data from wearable devices (steps, heart rate, sleep) and allows users to write journal entries, track their mood, and visualize their progress in an intuitive dashboard.
Key Components
1. Onboarding Flow: A series of visually engaging screens that introduce the app's journaling and visualization features.
2. Interactive Journaling Screen: Users can write journal entries, select their mood using an interactive emoji selector, and save the entry locally.
3. Data Visualization Dashboard: A dashboard displaying health metrics and mood trends over time.
Features
* Onboarding Flow with smooth transitions and motivational content.
* Journaling Screen for writing entries and tracking mood and health data.
* Data Visualization Dashboard with line graphs for mood trends and total step count.
Installation
Prerequisites
* Flutter SDK: >=3.7.0
* Dart SDK: >=3.7.0
Steps
1. Clone this repository:
bash
Copy code
git clone https://github.com/Lubaib123/fitnessapp.git
1. Navigate to the project directory:
bash
Copy code
cd fitapp
1. Install the required dependencies:
bash
Copy code
flutter pub get
1. Run the project:
bash
Copy code
flutter run
Dependencies
* flutter: Core Flutter SDK.
* bloc: State management with the BLoC pattern.
* get_it: Dependency injection.
* flutter_svg: For handling SVG images.
* lottie: For animations.
* permission_handler: To handle permissions.
* hive: Lightweight and fast key-value database.
* fl_chart: For charting and data visualization.
* intl: For internationalization.
* video_player: For handling video playback.
* google_fonts: For custom fonts.
API Simulation
For this app, there are simulated APIs that provide motivational messages and health metrics.
Motivational Messages API Simulation
API Response:
json
Copy code
{
  "message": "You're doing great! Keep it up!"
}
Health Metrics API Simulation
API Response:
json
Copy code
{
  "steps": 7200,
  "heartRate": 72,
  "lastUpdated": "2024-12-25T10:00:00Z"
}
Screens
1. Onboarding Flow
The onboarding flow consists of 2-3 screens that introduce the app’s journaling and visualization features. It includes animations or transitions and fetches a motivational message from the API.
2. Interactive Journaling Screen
On the journaling screen, users can:
* Write a journal entry using a text input field.
* Select their mood with an emoji selector.
* Save their entry along with the mood and date locally (Hive).
* Display a motivational message from the API.
* Fetch and display the user's step count from the simulated Health Metrics API.
3. Data Visualization Dashboard
The dashboard provides:
* A line graph showing mood trends over the past 7 entries.
* A highlight card showcasing the most positive mood entry.
* Total steps fetched from the Health Metrics API.
* Dynamic updates as new entries are added.
Contributing
Feel free to fork the repository, create a new branch, and submit a pull request. Contributions are welcome!
How to contribute:
1. Fork the repository.
2. Create a new branch.
3. Make your changes.
4. Submit a pull request.
License
This project is licensed under the MIT License - see the LICENSE file for details.
Acknowledgements
* Flutter for the awesome framework.
* Hive for lightweight local storage.
* FL Chart for beautiful graphs and data visualization.

Demo Video
[Link to Demo Video](https://drive.google.com/file/d/1mH99VAwWFkfW0XtzTDdAxoB6ZayQWOwz/view?usp=sharing)

