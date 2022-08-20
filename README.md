# flutter_study_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Firebase DB rules for it to work

<!-- rules_version = '2'; service cloud.firestore {
match /databases/{database}/documents { 
    match /questionPapers/{ppr}/questions/{q}{ 
      allow read, write: if request.auth != null 
      }
      
	match /leaderboard/{document=**} { 
  	allow read, write: if true;
	}
    match /questionPapers/{document=**} { 
      allow read, write: if true;
    }
    match /users/{document=**} { 
      allow read, write: if true;
    }
} 
} -->

continue @2:22:49 