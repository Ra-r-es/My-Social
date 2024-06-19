# Project: Social Media Database

## Overview

This project implements a relational database for a social media platform, designed to store and manage user data, posts, multimedia content, interactions, groups, events, and direct messages. The database schema ensures referential integrity through foreign key constraints and automatic primary key generation using sequences and triggers.

## Features

- **User Management:** Stores user information including name, email, password, and registration date.
- **Posts and Multimedia:** Supports text posts, videos, and photos with associated metadata.
- **Interactions:** Tracks likes, comments, and reactions to posts.
- **Social Connections:** Manages followers and group memberships.
- **Events:** Allows users to create and participate in events.
- **Messaging:** Facilitates direct messaging between users.

## Database Schema

### 1. Sequences

To automatically generate unique IDs for each table, sequences are used. Each table with an auto-incrementing primary key has an associated sequence.

### 2. Triggers

Triggers are used to automatically assign values from sequences to the primary key fields before inserting a new record into the respective tables.

## Key Components

### User Management

- **Users (`Utilizator`):** Stores user information such as `id_utilizator`, `nume`, `email`, `parola`, and `data_inregistrare`.

### Posts and Multimedia

- **Posts (`Postari`):** Contains post details with `id_postari`, `id_utilizator`, and `data_postarii`.
- **Videos (`Video`):** Stores video-specific data linked to posts, including `id_video`, `id_postari`, `titlu`, `durata`, `data_upload`, and `url`.
- **Photos (`Poze`):** Manages photo data linked to posts with `id_poze`, `id_postari`, `nume_poze`, and `data_upload`.

### Interactions

- **Likes (`LIKE`):** Tracks likes on posts with `id_like`, `id_utilizator`, `id_postari`, and `data_like`.
- **Comments (`Comentarii`):** Stores comments with `id_comentarii`, `id_utilizator`, `id_postari`, `data_comentariu`, and `continut`.
- **Reactions (`Reactie`):** Records various types of reactions to posts with `id_reactie`, `id_postari`, `tip_reactie`, and `data_reactie`.
- **Tags (`Tag`):** Associates tags with posts using `id_tag`, `id_postari`, and `nume_tag`.

### Social Connections

- **Followers (`Follow`):** Tracks followers with `id_follow`, `id_utilizator`, and `data_follow`.
- **Groups (`Grup`):** Manages user groups with `id_grup` and `nume`.
- **Group Members (`Membru_Grup`):** Links users to groups with `id_membru_grup`, `id_grup`, `id_utilizator`, and `data_intrare`.

### Events

- **Events (`Eveniment`):** Contains event details with `id_eveniment`, `nume`, and `data_eveniment`.
- **Event Participants (`Participant_Eveniment`):** Links users to events with `id_participant_eveniment`, `id_utilizator`, `id_eveniment`, and `data_inregistrare`.

### Messaging

- **Messages (`Mesaj`):** Facilitates direct messaging with `id_mesaj`, `id_utilizator_sender`, `id_utilizator_receiver`, `continut`, and `data_trimitere`.

## Setup

1. **Create Sequences:** Run the provided SQL commands to create sequences for each table.
2. **Create Triggers:** Implement the triggers to automate ID generation.
3. **Create Tables:** Create the tables with the specified columns and constraints.

This schema is designed to handle the core functionalities of a social media platform, ensuring data integrity and efficient management of user interactions and multimedia content.
