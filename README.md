# Model planning

## User

### name STRING
    - presence: true
    - uniqueness: true
    - format: {with: /[a-zA-Z0-9]+/, message: "only alphanumeric characters"}
    - length: {minimum: 2}

### password STRING
    - presence: true
    - format: {with: /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$/, message "must contain uppercase, lowercase and a number"}
    - length: {minimum: 8}
    - confirmation: true

### password_confirmation
    - presence: true

### email STRING
    - presence: true
    - uniqueness: true

### email_confirmation
    - presence: true

## Post

### user_id FOREIGN_KEY
    - presence: true
    - validates_associated :user

### title STRING
    - presence: true
    - length: {minimum: 2}

### body TEXT
    - presence: true
    - length: {minimum: 10}