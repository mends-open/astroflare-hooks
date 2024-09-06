-- Migration number: 0002 	 2024-08-28T19:27:25.873Z
-- 002_create_incoming_hook_events_table.sql
CREATE TABLE incoming_hook_events (
    id INTEGER PRIMARY KEY AUTOINCREMENT,   -- Auto-incrementing primary key
    hook_id INTEGER REFERENCES hooks(id) ON DELETE CASCADE, -- Foreign key to the hooks table
    request_body TEXT NOT NULL,             -- The JSON payload of the incoming webhook
    request_headers TEXT NOT NULL,          -- The headers of the incoming webhook request
    request_query TEXT,                     -- Optional query parameters of the request
    received_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- When the webhook was received
    scheduled_retry_after TIMESTAMP DEFAULT NULL  -- Timestamp when a retry should be attempted
);

-- Index for efficiently querying scheduled retries
CREATE INDEX idx_scheduled_retry_after ON incoming_hook_events(scheduled_retry_after);
