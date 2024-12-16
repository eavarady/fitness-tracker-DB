# fitness-tracker-DB
PostgresSQL Database created as a Portfolio Project for the Computer Science Career Path in Codecademy.

This project contains the schema for a fitness tracking database that stores data related to users, workouts, goals, progress logs, nutrition plans, and meals. The database is designed to support various operations, such as tracking user workouts, logging progress, and managing nutrition plans.

## Tables

### Users
Stores information about users including personal details and their physical attributes.

- `user_id` (Primary Key) - Unique identifier for each user.
- `first_name` - User's first name.
- `last_name` - User's last name.
- `email` - User's email address (unique and not null).
- `date_of_birth` - User's date of birth.
- `gender` - User's gender.
- `height` - User's height in centimeters.
- `weight` - User's weight in kilograms.

### Workouts
Stores information about different workout types.

- `workout_id` (Primary Key) - Unique identifier for each workout.
- `name` - Name of the workout.
- `category` - Category of the workout (e.g., strength, cardio).
- `duration` - Duration of the workout in minutes.
- `calories_burned` - Calories burned during the workout.

### Goals
Tracks the goals set by users for fitness progress.

- `goal_id` (Primary Key) - Unique identifier for each goal.
- `user_id` (Foreign Key) - References `Users(user_id)`.
- `goal_type` - Type of goal (e.g., weight loss, muscle gain).
- `target_value` - Target value for the goal (e.g., weight to reach).
- `start_date` - Date the goal was set.
- `end_date` - Date the goal should be achieved by.

### Progress Logs
Stores records of workouts performed by users and tracks progress over time.

- `log_id` (Primary Key) - Unique identifier for each progress log.
- `user_id` (Foreign Key) - References `Users(user_id)`.
- `workout_id` (Foreign Key) - References `Workouts(workout_id)`.
- `date` - Date of the workout.
- `duration` - Duration of the workout in minutes.
- `calories_burned` - Calories burned during the workout.
- `weight_logged` - User's weight logged after the workout.

### Nutrition Plans
Stores the nutrition plans assigned to users to help achieve their fitness goals.

- `plan_id` (Primary Key) - Unique identifier for each nutrition plan.
- `user_id` (Foreign Key) - References `Users(user_id)`.
- `plan_name` - Name of the nutrition plan.
- `daily_calorie_goal` - Daily calorie goal for the user.
- `start_date` - Date the nutrition plan starts.
- `end_date` - Date the nutrition plan ends.

### Meals
Stores details about meals associated with nutrition plans.

- `meal_id` (Primary Key) - Unique identifier for each meal.
- `plan_id` (Foreign Key) - References `Nutrition_Plans(plan_id)`.
- `meal_name` - Name of the meal.
- `calories` - Calories in the meal.
- `protein` - Protein content in grams.
- `carbs` - Carbohydrate content in grams.
- `fats` - Fat content in grams.

## Optimization

The database is optimized for both performance and maintainability:

- **Indexes**: Indexes have been added to frequently queried columns such as `user_id`, `workout_id`, and `email`.
- **Normalization**: The database is normalized to **3NF (Third Normal Form)** to eliminate redundancy and improve data integrity.
- **Foreign Keys**: Foreign key constraints are used to maintain referential integrity between tables.

## SQL Schema

You can find the SQL schema used to create the database below:

```sql
-- Create Users table
CREATE TABLE "users" (
    "user_id" SERIAL PRIMARY KEY,
    "first_name" VARCHAR(50),
    "last_name" VARCHAR(50),
    "email" VARCHAR(100) UNIQUE NOT NULL,
    "date_of_birth" DATE,
    "gender" VARCHAR(10),
    "height" DECIMAL(4, 1),
    "weight" DECIMAL(5, 1)
);

-- Create Workouts table
CREATE TABLE "workouts" (
    "workout_id" SERIAL PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL,
    "category" VARCHAR(50),
    "duration" INTEGER,
    "calories_burned" INTEGER
);

-- Create Goals table
CREATE TABLE "goals" (
    "goal_id" SERIAL PRIMARY KEY,
    "user_id" INTEGER REFERENCES "users"("user_id") ON DELETE CASCADE,
    "goal_type" VARCHAR(50),
    "target_value" DECIMAL(10, 2),
    "start_date" DATE,
    "end_date" DATE
);

-- Create Progress Logs table
CREATE TABLE "progress_logs" (
    "log_id" SERIAL PRIMARY KEY,
    "user_id" INTEGER REFERENCES "users"("user_id") ON DELETE CASCADE,
    "workout_id" INTEGER REFERENCES "workouts"("workout_id") ON DELETE SET NULL,
    "date" DATE NOT NULL,
    "duration" INTEGER,
    "calories_burned" INTEGER,
    "weight_logged" DECIMAL(5, 1)
);

-- Create Nutrition Plans table
CREATE TABLE "nutrition_plans" (
    "plan_id" SERIAL PRIMARY KEY,
    "user_id" INTEGER REFERENCES "users"("user_id") ON DELETE CASCADE,
    "plan_name" VARCHAR(100),
    "daily_calorie_goal" INTEGER,
    "start_date" DATE,
    "end_date" DATE
);

-- Create Meals table
CREATE TABLE "meals" (
    "meal_id" SERIAL PRIMARY KEY,
    "plan_id" INTEGER REFERENCES "nutrition_plans"("plan_id") ON DELETE CASCADE,
    "meal_name" VARCHAR(100),
    "calories" INTEGER,
    "protein" DECIMAL(5, 2),
    "carbs" DECIMAL(5, 2),
    "fats" DECIMAL(5, 2)
);
