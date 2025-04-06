Mini Games Mockup for Open Food Facts
Mini Games is a mockup project that showcases engaging, educational mini-games designed for integration into the Open Food Facts mobile app. These games aim to promote awareness about food nutrition, product transparency, and healthy decision-making through playful interaction with real product data from the Open Food Facts API.

This project is being developed as part of my proposal for Google Summer of Code (GSoC) 2025 with Open Food Facts.

🎯 Project Objectives
✅ Create intuitive and fun games that leverage Open Food Facts data

✅ Educate users on nutrition and product labeling

✅ Encourage community contributions through gamification

✅ Lay the foundation for full integration into the official Open Food Facts mobile app

🕹️ Games Implemented
1. How Much Sugar? – Sugar Cube Guessing Game
Objective: Estimate the sugar content (in sugar cubes) of a food product based on its image and name.

Gameplay:

A product's image and name are displayed.

The user guesses the sugar content using a slider.

Sugar cube animation provides visual feedback.

The next product loads after a brief delay.

Features:

🍭 Falling sugar cube animation for incorrect guesses

🔍 Debug mode to display actual sugar content for each barcode

🎨 Clean, engaging UI with feedback after each round

2. Caloprix – Nutri-Score Guessing Game
Objective: Guess the Nutri-Score (A to E) of a product.

Gameplay:

Users are shown a product's image and name.

They guess its Nutri-Score.

Feedback is provided and a streak of correct guesses is tracked.

Highlights:

Promotes understanding of how Nutri-Scores are calculated

Encourages informed decision-making through repetition

3. The Price is Right – Price Guessing Game
Objective: Estimate the product’s price using visual cues.

Gameplay:

A product’s image and name are shown.

Users guess its price using a slider.

Hints such as “More” or “Less” are provided.

Users try to guess the correct price in as few attempts as possible.

✨ Current Features
✅ Live Product Data: Fetches real product details via the Open Food Facts REST API

✅ Randomized Barcodes: Selects product entries from a dynamic list

✅ Resilient Error Handling: Displays fallback UI if API calls fail

✅ Custom UI Design:

Top black bar with white text

Brownish-grey background for consistency

Mild brown buttons with white text

✅ Lightweight Animations: Includes a sugar cube drop animation in the sugar game

🔮 Planned Features
📈 Gameplay & Educational Enhancements
Add additional nutritional metrics (e.g. fat, protein, fiber)

Show full product breakdown and explanations after each round

Display brief facts on what Nutri-Scores represent

🌎 Leaderboards & Multiplayer
Global & friend-based leaderboards

Real-time competitive gameplay

🔍 Barcode Scanning
Scan real-world products to play with live data

🗣️ Localization
Multi-language support for global accessibility

📡 Offline Mode
Cache product data for gameplay without internet

🧠 AI-Driven Features
Recommend products and challenges based on user behavior

Adjust difficulty based on user history

🏅 Gamification
Unlock achievements, badges, and levels

Introduce daily and weekly challenges

🧩 Customization
Allow filtering by category (e.g., snacks, beverages)

Choose difficulty or game type

📱 Integration with Open Food Facts App
Seamless embedding within the Open Food Facts mobile app

Use the official product database for consistent user experience

🛠️ Tech Stack
Flutter – Cross-platform mobile app development

Dart – Core programming language

REST API – Interaction with Open Food Facts API

Animation – Basic widget animations for gameplay feedback
