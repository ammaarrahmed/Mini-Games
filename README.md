Sugar Game - Mini Games Mockup for Open Food Facts
This project is an initial mockup of mini-games designed to be integrated into the Open Food Facts app. The goal is to create engaging and educational games that leverage the Open Food Facts API to promote awareness about food products, their nutritional values, and other related data. This mockup is part of my application for Google Summer of Code (GSoC) 2025 with Open Food Facts.

Games Included
1. How Much Sugar?
Objective: Guess the sugar content (in cubes) of a product based on its image and name.
Gameplay:
A product is displayed with its name and image.
The user guesses the sugar content using a slider.
Feedback is provided, and the next product is loaded after a short delay.
Features:
Falling sugar cube animation for incorrect guesses.
Debug mode to display sugar content for all barcodes.
2. Caloprix (Nutri-Score Guessing)
Objective: Guess the Nutri-Score (A, B, C, D, or E) of a product based on its image and name.
Gameplay:
A product is displayed with its name and image.
The user selects a Nutri-Score.
Feedback is provided, and the user's streak of correct guesses is tracked.
3. The Price is Right (Price Guessing)
Objective: Guess the price of a product.
Gameplay:
A product is displayed with its name and image.
The user guesses the price using a slider.
Feedback is provided, and the next product is loaded after a short delay.
Features
Current Features
Dynamic Product Data: Products are fetched dynamically using the Open Food Facts API.
Randomized Gameplay: Each game selects a random product from a predefined list of barcodes.
Error Handling: Fallback logic ensures the app remains functional even if API calls fail.
Custom UI:
Black top bar with white text.
Brownish-grey background for all games.
Mild brown buttons with white text.
Animations: Falling sugar cubes animation in the "How Much Sugar?" game.
Possible Feature Additions
Expanded Product Data:

Include more product attributes like fat, protein, and fiber for additional games.
Display detailed product information after each round.
Leaderboard:

Track and display high scores for each game.
Allow users to compete globally or with friends.
Multiplayer Mode:

Add a competitive mode where users can play against each other in real-time.
Educational Insights:

Provide brief explanations for Nutri-Scores and other nutritional values.
Include tips for healthier food choices.
Barcode Scanning:

Allow users to scan barcodes of real products to play the games with live data.
Localization:

Support multiple languages to make the games accessible globally.
Offline Mode:

Cache product data to allow gameplay without an internet connection.
Further Feature Implementation
Integration with Open Food Facts App:

Embed these games into the Open Food Facts app to increase user engagement.
Use the app's existing database for real-time product data.
Gamification:

Add achievements, badges, and rewards for completing challenges.
Introduce daily challenges to encourage regular gameplay.
AI-Powered Recommendations:

Use machine learning to recommend products based on user preferences and gameplay history.
Customizable Gameplay:

Allow users to select specific product categories (e.g., beverages, snacks) for tailored gameplay.
