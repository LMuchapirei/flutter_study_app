# flutter_study_app

About
A follow along to build a study app and hopefully scale it after a solid foundation provided by the video (https://www.youtube.com/watch?v=ZSVnIphlGKI&ab_channel=dbestech)

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

Finished waiting for part two but building some of the stuff demoed on my own in this part_sel branch

Part 2 received 
now @ 1:25:00


Part 3 in progress

New Widgets to look at 
  1. Visibility
  2. ColoredBox  @2:01:06
  3. How implementing PreferredSizeWidget helps with the appBar situation
  4. ShapeDecoration
  5. StadiumBorder
  6. extendBodyBehindAppBar property for the scaffold
  7. Positioned.fill(
            // Creates a Positioned object with [left], [top], [right], and [bottom] set to 0.0 unless a value for them is passed.
  8. string method padLeft or padRight
  9. ~/ Truncating division operator
  Performs truncating division of this number by [other]. Truncating division is division where a fractional result is converted to an integer by rounding towards zero.

If both operands are [int]s, then [other] must not be zero. Then a ~/ b corresponds to a.remainder(b) such that a == (a ~/ b) * b + a.remainder(b).

If either operand is a [double], then the other operand is converted to a double before performing the division and truncation of the result. Then a ~/ b is equivalent to (a / b).truncate(). This means that the intermediate result of the double division must be a finite integer (not an infinity or [double.nan]).
  10. What is this   AppIcons._();
  11. SliverGridDelegateWithFixedCrossAxisCount, GridView Builder
  12. InkWidget
  Continue @03:54:48
