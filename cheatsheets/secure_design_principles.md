# Sources
* Alice & Bob Learn: Application Security

## Security Fundamentals
* CIA Triad: confidentality, integrity, availability
* Assume Breach
    - always assume that someone is already in your system to avoid sharing sensitive data, where it is not needed
* Insider Threat
    - people with granted access can misuse / conflict the CIA Triad
* Defense in Depth
    - concept of having multiple security layers in case one fails
* Least Privilege
    - concept of granting access only where it is absolutely necessary
* Supply Chain Security
    - tracking all parts of your software / development process
* Security by Obscurity
    - concept of hiding / removing parts of your software that is not used / should not be used by others
* Attack Surface Reduction
    - similar to security by obscurity
* Hard Coding
    - always keep code generic and validate inputs / values instead of hard coding values (error prone)
* Usable Security
    - humans are good at hijacking security features if they are annoying
* Authentication

## Security Requirements
* Encryption
    - two-way (encrypt and decrypt with a key), to secure data on the way to its recipient
* System Input
    - anything from outside your application could potentially harm your application / system
* Encoding / Escaping
    - used to display in browser and when sending data to prevent malicious code
* Third Party Components
    - any code / logic that is not written by yourself is potentially dangerous, use as least as possible
* Security Headers
    - use as many secure header options as possible and suitable for your protocols
* Passwords
    - use password manager, never hard code, use hashing, salting (user specific, stored in db) and peppering (application specific, stored outside of application)
* Storage
    - Encrypt data that rests and dont even trust your own data (database)
* Backup and Rollback
    - Backup System in a different physical location so rolling back in case of emergency is easy and fast
* Framework Security Features
    - Use framework security functionality wherever possible instead of writing your own logic
* Technical Debt = Security Debt
    - making rushed decisions will haunt you and your security later
* File Uploads
    - most dangerous form of user interaction, avoid if possible
* Errors and Logging
    - log out all errors, never log sensitive information, alert if security concerns
* Input Validation and Sanitation
    - always validate input, even your own, both on server side and client side; approve / whitelist instead of blacklist / block
* Parameterized Queries
    - always use them to interact with sql database so no sql injections are possible
* Least Privilege
    - use service accounts that have the least permissions possible, instead of user accounts when performing actions with your application

## Secure Design
* Design Flaw vs Security Bug
    - Mistake in the planning vs mistake in the implementation. Mistakes in planning are way more costly in the end and take longer to fix
* Protect Sensitive Data
* Never Trust, Always Verify, Assume Breach
* Backup and Rollback
* Server Side Validation
* Framework Security Features
* Security Function Isolation
* Application Partitioning
* Reauthentication for Transactions (CSRF)
* Segregation of Product Data
* Protection of Source Code
* Threat Modeling

## Secure Coding
