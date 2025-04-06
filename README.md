Mini Games for Open Food Facts
Overview
Mini Games for Open Food Facts is a proposal for integrating educational, interactive mini-games into the Open Food Facts mobile app. These games aim to raise awareness about nutrition, promote healthier food choices, and encourage user participation by leveraging real product data from the Open Food Facts API.

This project is being developed as part of my proposal for Google Summer of Code (GSoC) 2025 with Open Food Facts.

Project Objectives
Develop intuitive and engaging mini-games that utilize real-time Open Food Facts data.

Educate users on food labels, nutritional values, and product transparency.

Promote community contribution through gamified elements.

Establish a scalable framework for future integration into the official Open Food Facts app.

Implemented Games
1. How Much Sugar? – Sugar Cube Guessing Game
Objective: Estimate the sugar content (in sugar cubes) of a product using its image and name.
Gameplay:

Display product name and image.

User guesses sugar content via a slider.

Animated sugar cubes fall for incorrect guesses.

Actual sugar value revealed (debug mode optional).

Features:

Animated sugar feedback for visual learning.

Debug mode to display real values for all barcodes.

Clean, responsive UI with real-time updates.

2. Caloprix – Nutri-Score Guessing Game
Objective: Guess the Nutri-Score (A to E) of a given product.
Gameplay:

Product image and name are displayed.

User selects the Nutri-Score.

Immediate feedback with a streak tracker.

Highlights:

Enhances understanding of Nutri-Score logic.

Reinforces learning through repetition and progression.

3. The Price is Right – Price Guessing Game
Objective: Estimate the price of a food product as accurately as possible.
Gameplay:

Product image and name are shown.

Slider used to adjust the price guess.

Feedback provided via “More” or “Less” hints.

Goal: Correct price in fewest attempts.

Current Features
Dynamic product data fetched via Open Food Facts REST API.

Random product selection from a barcode list.

Robust error handling for API failures.

Custom UI theme:

Black top bar with white text

Brown-grey background

Mild brown buttons with white text

Lightweight animations (e.g., sugar cubes falling).

Planned Features
🔹 Gameplay & Educational Enhancements
Add fat, protein, and fiber values to games.

Display nutritional facts and product breakdown after each round.

Provide brief educational tooltips for Nutri-Score and nutrient interpretation.

🔹 Leaderboards & Multiplayer
Global and friend-based leaderboards.

Real-time multiplayer support for competitive gameplay.

🔹 Barcode Scanning Integration
Allow users to scan real-world product barcodes.

Use live data to power game sessions dynamically.

🔹 Localization & Accessibility
Multi-language support.

UI/UX optimized for accessibility across global demographics.

🔹 Offline Mode
Cache selected product data for gameplay without internet access.

🔹 AI-Driven Recommendations
Suggest challenges/products based on past performance.

Adapt difficulty based on player history for a balanced experience.

🔹 Gamification & User Retention
Introduce achievements, badges, and level systems.

Offer daily and weekly challenges for recurring engagement.

🔹 Customization Options
Allow filtering by category (e.g., beverages, snacks).

Enable users to select game difficulty or specific game modes.

🔹 Integration with Open Food Facts App
Seamless integration with the main mobile application.

Leverage live product database for real-time accuracy and extended functionality.

Tech Stack
Flutter – For cross-platform mobile development.

Dart – Primary programming language.

REST API – To fetch and update real product data.

Custom Animations – To enhance user experience and feedback mechanisms.

