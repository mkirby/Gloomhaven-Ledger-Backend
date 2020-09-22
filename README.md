# Gloomhaven Ledger
 
- A `Campaign` has many Parties
- A `Party`has many Characters
- A `User` has many Characters
- A `Character` belongs to a `Party` and belongs to a `User`

- A `Campaign` has many `Character`s through it's `Party`
- A `Character` is only in one `Campaign`