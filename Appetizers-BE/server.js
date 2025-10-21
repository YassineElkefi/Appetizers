const express = require('express');
const app = express();
const PORT = 3000;

// Mock appetizer data
const appetizers = [
  {
    id: 1,
    name: "Mozzarella Sticks",
    description: "Crispy breaded mozzarella cheese sticks served with marinara sauce",
    protein: 18,
    calories: 420,
    carbs: 32,
    price: 8.99,
    imageURL: "http://localhost:3000/images/mozzarella-sticks.jpeg"
  },
  {
    id: 2,
    name: "Buffalo Wings",
    description: "Spicy chicken wings tossed in buffalo sauce with ranch dressing",
    protein: 24,
    calories: 540,
    carbs: 12,
    price: 12.99,
    imageURL: "http://localhost:3000/images/buffalo-wings.jpg"
  },
  {
    id: 3,
    name: "Bruschetta",
    description: "Toasted bread topped with fresh tomatoes, garlic, basil, and olive oil",
    protein: 6,
    calories: 180,
    carbs: 28,
    price: 7.99,
    imageURL: "http://localhost:3000/images/bruschetta.jpg"
  },
  {
    id: 4,
    name: "Spinach Artichoke Dip",
    description: "Creamy blend of spinach, artichokes, and cheese served with tortilla chips",
    protein: 12,
    calories: 380,
    carbs: 24,
    price: 9.99,
    imageURL: "http://localhost:3000/images/spinach-dip.jpg"
  },
  {
    id: 5,
    name: "Calamari Rings",
    description: "Lightly battered and fried squid rings with lemon aioli",
    protein: 16,
    calories: 320,
    carbs: 30,
    price: 11.99,
    imageURL: "http://localhost:3000/images/calamari.webp"
  },
  {
    id: 6,
    name: "Nachos Supreme",
    description: "Tortilla chips loaded with cheese, jalapeños, sour cream, and guacamole",
    protein: 14,
    calories: 620,
    carbs: 58,
    price: 10.99,
    imageURL: "http://localhost:3000/images/nachos.jpg"
  },
  {
    id: 7,
    name: "Stuffed Mushrooms",
    description: "Mushroom caps filled with herbed cream cheese and breadcrumbs",
    protein: 7,
    calories: 210,
    carbs: 15,
    price: 8.49,
    imageURL: "http://localhost:3000/images/stuffed-mushrooms.jpeg"
  },
  {
    id: 8,
    name: "Potato Skins",
    description: "Crispy potato skins topped with cheddar, bacon, and green onions",
    protein: 10,
    calories: 350,
    carbs: 29,
    price: 9.49,
    imageURL: "http://localhost:3000/images/potato-skins.jpg"
  },
  {
    id: 9,
    name: "Shrimp Cocktail",
    description: "Chilled shrimp served with tangy cocktail sauce",
    protein: 20,
    calories: 160,
    carbs: 6,
    price: 13.99,
    imageURL: "http://localhost:3000/images/shrimp-cocktail.jpg"
  },
  {
    id: 10,
    name: "Fried Pickles",
    description: "Crispy battered pickle chips served with ranch dip",
    protein: 3,
    calories: 220,
    carbs: 22,
    price: 7.49,
    imageURL: "http://localhost:3000/images/fried-pickles.jpg"
  },
  {
    id: 11,
    name: "Quesadilla",
    description: "Grilled flour tortilla stuffed with cheese and peppers, served with salsa",
    protein: 12,
    calories: 400,
    carbs: 36,
    price: 8.99,
    imageURL: "http://localhost:3000/images/quesadilla.jpeg"
  },
  {
    id: 12,
    name: "Crab Cakes",
    description: "Pan-seared crab cakes with remoulade sauce",
    protein: 14,
    calories: 310,
    carbs: 18,
    price: 14.99,
    imageURL: "http://localhost:3000/images/crab-cakes.jpg"
  },
  {
    id: 13,
    name: "Egg Rolls",
    description: "Crispy egg rolls stuffed with vegetables and pork, served with sweet chili sauce",
    protein: 8,
    calories: 270,
    carbs: 28,
    price: 7.99,
    imageURL: "http://localhost:3000/images/egg-rolls.jpg"
  },
  {
    id: 14,
    name: "Garlic Bread",
    description: "Toasted baguette slices brushed with garlic butter and herbs",
    protein: 5,
    calories: 190,
    carbs: 24,
    price: 5.99,
    imageURL: "http://localhost:3000/images/garlic-bread.jpg"
  }
];

// Middleware
app.use(express.json());

// Serve static files from public directory
app.use(express.static('public'));

// Enable CORS for frontend access
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*');
  res.header('Access-Control-Allow-Headers', 'Content-Type');
  next();
});

// GET all appetizers
app.get('/api/appetizers', (req, res) => {
  setTimeout(() => {
    res.json({
      request: appetizers
    });
  }, 2000); // 2000ms = 2 seconds
});

// GET single appetizer by ID
app.get('/api/appetizers/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const appetizer = appetizers.find(app => app.id === id);
  
  if (appetizer) {
    res.json({
      request: [appetizer]
    });
  } else {
    res.status(404).json({ error: 'Appetizer not found' });
  }
});

// Start server
app.listen(PORT, () => {
  console.log(`Mock API server running on http://localhost:${PORT}`);
  console.log(`Try: http://localhost:${PORT}/api/appetizers`);
});