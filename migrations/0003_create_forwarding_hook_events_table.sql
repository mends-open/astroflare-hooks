-- Migration number: 0003     2024-08-28T19:27:26.386Z
-- 003_create_forwarding_hook_events_table.sql
CREATE TABLE forwarding_hook_events (
    id INTEGER PRIMARY KEY AUTOINCREMENT,    -- Auto-incrementing primary key
    incoming_hook_event_id INTEGER REFERENCES incoming_hook_events(id) ON DELETE CASCADE, -- Foreign key to incoming events
    forwarded_to TEXT NOT NULL,              -- The forwarding destination URL
    response_status INTEGER NOT NULL,        -- HTTP status code returned by the forwarded URL
    response_body TEXT NOT NULL,             -- The response body from the forwarding attempt
    response_headers TEXT NOT NULL,          -- The response headers from the forwarding attempt
    forwarded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- When the forwarding attempt occurred
);

-- Index on incoming_hook_event_id to optimize lookups for events tied to specific webhooks
CREATE INDEX idx_incoming_hook_event_id ON forwarding_hook_events(incoming_hook_event_id);

-- Index on forwarded_at to speed up queries that sort or filter by the time forwarding occurred
CREATE INDEX idx_forwarded_at ON forwarding_hook_events(forwarded_at);
