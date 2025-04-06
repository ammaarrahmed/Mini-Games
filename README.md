Mini Games for Open Food Facts
Mini Games is a mockup project that showcases engaging, educational mini-games designed for integration into the Open Food Facts mobile app. These games aim to promote awareness about food nutrition, product transparency, and healthy decision-making through interactive gameplay based on real product data fetched via the Open Food Facts API.

This project is being developed as part of my proposal for Google Summer of Code (GSoC) 2025 with Open Food Facts.

Project Objectives
Create intuitive and fun mini-games that leverage Open Food Facts data.

Educate users on nutrition labeling and healthy choices.

Encourage community contributions through gamification.

Build a foundation for future integration into the official Open Food Facts app.

Games Implemented
1. How Much Sugar? – Sugar Cube Guessing Game
Objective:
Estimate the sugar content (in sugar cubes) of a food product based on its image and name.

Gameplay:

A product's name and image are displayed.

The user guesses the sugar content using a slider.

Visual feedback is provided, including falling sugar cube animations.

The next product is loaded after a short delay.

Features:

Animated sugar cubes for incorrect guesses.

Debug mode to show actual sugar content for all barcodes.

Clean and responsive UI with real-time feedback.

2. Caloprix – Nutri-Score Guessing Game
Objective:
Guess the Nutri-Score (A to E) of a given product.

Gameplay:

A product's image and name are shown.

The user selects the Nutri-Score.

Correct or incorrect feedback is shown immediately.

A streak counter tracks consecutive correct answers.

Highlights:

Encourages better understanding of Nutri-Score logic.

Reinforces learning through repetition and progression.

3. The Price is Right – Price Guessing Game
Objective:
Guess the price of a food product as accurately as possible.

Gameplay:

The product name and image are presented.

The user adjusts a slider to estimate the price.

Hints such as “More” or “Less” help guide toward the correct answer.

The goal is to guess the price in the fewest attempts.

Current Features
Dynamic product data fetched from the Open Food Facts REST API.

Randomized product selection from a predefined barcode list.

Error handling and fallback behavior for failed API calls.

Custom UI theme:

Black top bar with white text.

Brownish-grey background across screens.

Mild brown buttons with white text.

Lightweight animations, such as falling sugar cubes in the sugar game.

Planned Features
Gameplay and Educational Enhancements
Incorporate additional nutritional data (e.g., fat, protein, fiber).

Show detailed product breakdown and educational facts after each round.

Provide brief explanations for Nutri-Scores and nutrition values.

Leaderboards and Multiplayer
Implement global and friend-based leaderboards.

Add real-time multiplayer functionality for competitive play.

Barcode Scanning Integration
Enable users to scan real-world product barcodes and play using live data.

Localization and Accessibility
Add support for multiple languages.

Ensure the interface is accessible across global user bases.

Offline Mode
Cache product data locally for gameplay without internet access.

AI-Driven Recommendations
Suggest products and challenges based on user preferences and performance.

Dynamically adjust game difficulty based on player history.

Gamification and User Retention
Add achievements, badges, and levels for long-term engagement.

Introduce daily or weekly challenges.

Customization Options
Allow filtering of products by category (e.g., beverages, snacks).

Let users choose difficulty or specific games to play.

Open Food Facts App Integration
Seamless integration with the Open Food Facts mobile application.

Utilize the main app’s live product database for real-time accuracy.

Tech Stack
Flutter – Cross-platform mobile app development.

Dart – Programming language used for Flutter.

REST API – For accessing Open Food Facts product data.

Custom Animation – For enhancing UI/UX (e.g., sugar cube fall).
