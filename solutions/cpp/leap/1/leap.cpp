#include "leap.h"

namespace leap {
    bool is_leap_year(int year)
    {
        bool leap=((year%4==0&&year%100!=0)||year%400==0);
        return leap;

    }
}  // namespace leap
