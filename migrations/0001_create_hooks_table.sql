-- Migration number: 0001     2024-08-28T19:27:25.331Z
-- 001_create_hooks_table.sql
CREATE TABLE hooks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,    -- Auto-incrementing primary key
    forwarding_url TEXT NOT NULL,            -- The destination URL to forward the webhook
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Timestamp when the hook was created
);

-- Add index on forwarding_url for faster lookup if needed in future queries
CREATE INDEX idx_forwarding_url ON hooks(forwarding_url);
