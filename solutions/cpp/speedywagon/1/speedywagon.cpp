#include "speedywagon.h"

namespace speedywagon {

// Enter your code below:

bool connection_check(pillar_men_sensor* sensor) {
    return sensor != nullptr;
}

int activity_counter(pillar_men_sensor* sensors, int count) {
    if (!sensors) return 0;
    int sum = 0;
    for(int i = 0; i < count; i++) {
        sum += sensors[i].activity;  // Bug: adding 1 extra
    }
    return sum;
}

bool alarm_control(pillar_men_sensor* sensor) {
    return sensor && sensor->activity > 9000;
}

bool uv_alarm(pillar_men_sensor* sensor) {
    if (!sensor) return false;
    int uv = uv_light_heuristic(&sensor->data);
    return uv > 0 && sensor->activity < 9000;
}

// Please don't change the interface of the uv_light_heuristic function
int uv_light_heuristic(std::vector<int>* data_array) {
    double avg{};
    for (auto element : *data_array) {
        avg += element;
    }
    avg /= data_array->size();
    int uv_index{};
    for (auto element : *data_array) {
        if (element > avg) ++uv_index;
    }
    return uv_index;
}

}  // namespace speedywagon
