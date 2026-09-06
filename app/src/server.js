const express = require("express");
const { Pool } = require("pg");

const app = express();

const PORT = process.env.PORT || 8080;

const pool = new Pool({
    host: process.env.DB_HOST || "database",
    port: process.env.DB_PORT || 5432,
    database: process.env.DB_NAME || "opsmate",
    user: process.env.DB_USER || "opsmate",
    password: process.env.DB_PASSWORD || "opsmatepassword"
});

app.get("/", (req, res) => {
    res.send(`
        <h1>OpsMate Service</h1>
        <p>Application is running successfully inside Docker!</p>
        <p>Environment: ${process.env.NODE_ENV || "development"}</p>
    `);
});

app.get("/health", (req, res) => {
    res.json({
        status: "healthy",
        service: "OpsMate"
    });
});

app.get("/db-test", async (req, res) => {
    try {
        const result = await pool.query("SELECT NOW() AS current_time");

        res.json({
            status: "success",
            message: "OpsMate successfully connected to PostgreSQL",
            database_time: result.rows[0].current_time
        });
    } catch (error) {
        console.error("Database connection failed:", error.message);

        res.status(500).json({
            status: "error",
            message: "Database connection failed"
        });
    }
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`OpsMate server running on port ${PORT}`);
});
