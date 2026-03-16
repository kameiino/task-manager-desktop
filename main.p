#include <iostream>
#include <string>
using namespace std;

/* ===== Базовий пристрій ===== */
class Device {
protected:
    string name;

public:
    Device(string n) : name(n) {}

    virtual void start() = 0;
};

/* ===== Сенсор сну ===== */
class SleepSensor : public Device {
private:
    int phase;

public:
    SleepSensor(int p) : Device("SleepSensor"), phase(p) {}

    void start() override {
        cout << "SleepSensor analyzing phase\n";
    }

    int getPhase() const {
        return phase;
    }
};

/* ===== Будильник ===== */
class Alarm : public Device {
private:
    bool active;

public:
    Alarm() : Device("Alarm"), active(false) {}

    void start() override {
        cout << "Alarm started\n";
    }

    void turnOn() {
        active = true;
    }

    bool isActive() const {
        return active;
    }
};

/* ===== Логування ===== */
class Logger {
public:
    void log(string msg) {
        cout << "[LOG] " << msg << endl;
    }
};

/* ===== Display ===== */
class Display {
public:
    void show(string msg) {
        cout << "[DISPLAY] " << msg << endl;
    }
};

/* ===== Notification ===== */
class Notification {
public:
    void send(string msg) {
        cout << "[NOTIFY] " << msg << endl;
    }
};

/* ===== Settings ===== */
class Settings {
private:
    int minPhase;

public:
    Settings(int p) : minPhase(p) {}

    int getMinPhase() const {
        return minPhase;
    }
};

/* ===== User ===== */
class User {
private:
    string name;

public:
    User(string n) : name(n) {}

    void wakeUp() {
        cout << name << " woke up!\n";
    }
};

/* ===== Analyzer ===== */
class SleepAnalyzer {
public:
    bool shouldWake(int phase, int minPhase) {
        return phase >= minPhase;
    }
};

/* ===== SmartAlarm ===== */
class SmartAlarm : public SleepSensor, public Alarm, public Logger {
private:
    int hour;

public:
    SmartAlarm(int p, int h) : SleepSensor(p), Alarm(), hour(h) {}

    void start() {
        cout << "SmartAlarm running at " << hour << ":00\n";
    }

    void analyze(int minPhase) {
        if (getPhase() >= minPhase) {
            turnOn();
            log("Alarm ON");
        } else {
            log("Alarm OFF");
        }
    }
};

/* ===== main ===== */
int main() {
    SmartAlarm alarm(3, 7);

    alarm.start();
    alarm.analyze(2);

    if (alarm.isActive()) {
        cout << "Будильник увімкнений\n";
    } else {
        cout << "Будильник вимкнений\n";
    }

    return 0;
}
