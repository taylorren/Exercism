#include <array>
#include <string>
#include <vector>
#include <cmath>
#include <sstream>
using namespace std;


// Round down all provided student scores.
std::vector<int> round_down_scores(std::vector<double> student_scores) {
    vector<int> new_scores;
    for(auto&s: student_scores)
    {
        new_scores.push_back(floor(s));
    }
    return new_scores;
}


// Count the number of failing students out of the group provided.
int count_failed_students(std::vector<int> student_scores) {
    int count=0;
    for(auto&s:student_scores)
    {
        if(s<=40)
        {
            count++;
        }
    }

    return count;
}

// Determine how many of the provided student scores were 'the best' based on the provided threshold.
std::vector<int> above_threshold(std::vector<int> student_scores, int threshold) {
    vector<int> above;
    for(auto&s: student_scores)
    {
        if(s>=threshold)
        {
            above.push_back(s);
        }
    }

    return above;    
}

// Create a list of grade thresholds based on the provided highest grade.
std::array<int, 4> letter_grades(int highest_score) {
    array<int,4> grades;
    int fail=40;
    int span=(highest_score-fail)/4;
    for(int i=0;i<4;i++)
    {
        int grade=i*span+fail+1;
        grades[i]=grade;
    }
    return grades;
}

// Organize the student's rank, name, and grade information in ascending order.
std::vector<std::string> student_ranking(std::vector<int> student_scores, std::vector<std::string> student_names) {
    vector<string> rankings;

    for(int i=0;i<student_names.size();i++)
    {
        string name;
        int score;
        name=student_names[i];
        score=student_scores[i];

        ostringstream oss;
        oss<<i+1<<". "<<name<<": "<<score;
        rankings.push_back(oss.str());
    }
    return rankings;
}

// Create a string that contains the name of the first student to make a perfect score on the exam.
std::string perfect_score(std::vector<int> student_scores, std::vector<std::string> student_names) {
    string res="";

    for(int i=0;i<student_names.size();i++)
    {
        if(student_scores[i]==100)
        {
            res=student_names[i];
            break;
        }
    }
    
    return res;
}
