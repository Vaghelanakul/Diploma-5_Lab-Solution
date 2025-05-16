// 1. Create a class named Candidate with Candidate_ID, Candidate_Name,
// Candidate_Age, Candidate_ Weight and Candidate_Height data members.
// Also create a method GetCandidateDetails() and
// DisplayCandidateDetails(}. Create main method to demonstrate the
// Candidate class. (A)

import "dart:io";

class Candidate {
  int candidateID = 0;
  String candidateName = "";
  int candidateAge = 0;
  double candidateHeight = 0;
  double candidateWeight = 0;
  

  void getCandidate() {
    print("enter id of candidate:");
    candidateID = int.parse(stdin.readLineSync()!);

    print("enter candidate name:");
    candidateName = stdin.readLineSync()!;

    print("enter candidate age:");
    candidateAge = int.parse(stdin.readLineSync()!);

    print("enter candidate height:");
    candidateHeight = double.parse(stdin.readLineSync()!);

    print("enter candidate weight:");
    candidateWeight = double.parse(stdin.readLineSync()!);
  }

  void displayCandidateDetails() {
    print("candidate id is:$candidateID");
    print("candidate name is:$candidateName");
    print("candidate age is:$candidateAge");
    print("candidate height is:$candidateHeight");
    print("candidate weight is:$candidateWeight");
  }
}

void main() {
  Candidate c1 = new Candidate();
  c1.getCandidate();

  c1.displayCandidateDetails();
}
