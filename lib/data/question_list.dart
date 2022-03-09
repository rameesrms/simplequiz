 import 'package:quiz/model/questionmodel.dart';




 List<QuestionModel> questions = [
   QuestionModel(
     "Which is the capital of India ?",
     {
       "Kerala": false,
       "Mumbai": false,
       "Delhi": true,
       "Chennai": false,
     },
   ),
   QuestionModel("Who is the King in Forest ?", {
     "Fox": false,
     "Elephant": false,
     "Cat": false,
     "Lion": true,
   }),
   QuestionModel("What is '2+2'?", {
     "5": false,
     "4": true,
     "1": false,
     "7": false,
   }),
   QuestionModel("Who created Flutter ?", {
     "Facebook": false,
     "IBM": false,
     "Google": true,
     "Twitter": false,
   }),




   QuestionModel(
       "How many letters does the word 'HAPPY' has ?", {
     "8": false,
     "5": true,
     "9": false,
     "2": false,
   }),
 ];