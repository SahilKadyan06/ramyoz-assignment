/*
  # Create notes table

  1. New Tables
    - `notes`
      - `id` (uuid, primary key) - Unique identifier for each note
      - `title` (text) - Title of the note
      - `content` (text) - Content/body of the note
      - `created_at` (timestamptz) - Timestamp when the note was created
  
  2. Security
    - Enable RLS on `notes` table
    - Add policy for public to read all notes (FOR SELECT)
    - Add policy for public to create notes (FOR INSERT)
    - Add policy for public to update notes (FOR UPDATE)
    - Add policy for public to delete notes (FOR DELETE)
  
  ## Important Notes
  - This is a simple demo app with public access to all notes
  - In a production app, you would typically restrict access based on user authentication
*/

CREATE TABLE IF NOT EXISTS notes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL DEFAULT '',
  content text NOT NULL DEFAULT '',
  created_at timestamptz DEFAULT now()
);

ALTER TABLE notes ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can view notes"
  ON notes FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Anyone can create notes"
  ON notes FOR INSERT
  TO public
  WITH CHECK (true);

CREATE POLICY "Anyone can update notes"
  ON notes FOR UPDATE
  TO public
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Anyone can delete notes"
  ON notes FOR DELETE
  TO public
  USING (true);