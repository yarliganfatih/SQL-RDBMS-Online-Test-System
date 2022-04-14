#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

using namespace std;

int main() {
    // test_question_links for without repetition values
    auto q_t_links = new int[20][2];
    auto links = new int[4][20];
    int counts[4] = {-1, 0, 0, 0};
    int awards[4] = {-1, 10, 30, 60};
    double durations[4] = {0.0, 15.0, 50.0, 50.0};
    int correct_answers[13] = {-1, 0, 0, 1, 1, 1, 2, 3, 1, 3, 2, 4, 3};
    
    int i = 0;
    while (i < 21) {
        int x = rand() % 3 + 1; // tests {1, 2, 3}
        int y = rand() % 12 + 1; // questions {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12}
        int used = 1;
        for (int j = 0; j < counts[x]; j++) {
            if (links[x][j] == y) {
                used = 0;
            }
        }
        if (used) {
            links[x][counts[x]] = y;
            counts[x]++;
            q_t_links[i][0] == x;
            q_t_links[i][1] == y;
            i++;
            cout << "INSERT INTO `test_question_links`(`t_id`, `q_id`) VALUES (" << x << "," << y << ");" << endl;
        }
    }

    // test_results users{3,4} tests{1,2,3} for random compatible sessions

    int qr_id = 1;

    for (int i = 1; i < 6; i++) { // i = tr_id
        cout << endl;
        int user_id = rand() % 2 + 3; // users {3, 4}
        int test = rand() % 3 + 1;    // tests {1, 2, 3}
        int correct = 0;
        int wrong = 0;
        int total = 0;
        double net = 0.0;
        for (int j = 0; j < counts[test]; j++) {
            int question = links[test][j];
            int users_answer = rand() % 3; // users' answers {0, 1, 2}
            int is_correct = 0;
            if (users_answer == correct_answers[question]) {
                is_correct = 1;
                correct++;
            }
            else{
                wrong++;
            }
            
            // extra intervention
            // for increasing correct ratio
            if (rand() % 2) { // 50% chance
                wrong--;
                correct++;
                is_correct = 1;
                users_answer = correct_answers[question];
            }

            total++;
            cout << "INSERT INTO `question_results`(`qr_id`, `createdAt`, `visible`, `u_id`, `users_answer`, `is_correct`, `tr_id`, `q_id`) VALUES (" << qr_id << ",CURRENT_TIMESTAMP,1," << user_id << "," << users_answer << "," << is_correct << "," << i << "," << question << ");" << endl;
            qr_id++;
        }
        net = correct - wrong / 4.0;
        if (net < 0) {
            net = 0;
        }
        int taken_score = (net / total) * awards[test];
        int duration = rand() % int(durations[test] - 5) + 5;
        cout << endl;
        cout << "INSERT INTO `test_results`(`tr_id`, `createdAt`, `visible`, `u_id`, `t_id`, `net`, `correct`, `wrong`, `total`, `duration`, `taken_score`) VALUES (" << i << ",CURRENT_TIMESTAMP,1," << user_id << "," << test << "," << net << "," << correct << "," << wrong << "," << total << "," << duration << "," << taken_score << ");" << endl;
    }
    return 0;
}
