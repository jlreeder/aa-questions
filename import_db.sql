CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  FOREIGN KEY (user_id) REFERENCES users.id,
  FOREIGN KEY (question_id) REFERENCES questions.id
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users.id,
  FOREIGN KEY (question_id) REFERENCES questions.id,
  FOREIGN KEY (parent_reply_id) REFERENCES replies.id
);
