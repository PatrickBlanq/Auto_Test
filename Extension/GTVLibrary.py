

def calculate_time_add(time_original, seconds):
    # Add seconds to your time
    result = time_to_seconds(time_original) + int(seconds)
    result = seconds_to_time(result)
    print("当前时间戳为:", result)
    return result


def calculate_time_sub(time_original, seconds):
    # Subtract seconds to your time
    result = time_to_seconds(time_original) - int(seconds)
    result = seconds_to_time(result)
    print("当前时间戳为:", result)
    return result


def time_to_seconds(time_original):
    # Translate time to seconds
    if time_original != '0':
        time_array = time_original.strip().split(":")
        # If time doesn't have hour attribute
        if len(time_array) == 2:
            time_original = "0:" + time_original

        h, m, s = time_original.strip().split(":")
        result = int(h) * 3600 + int(m) * 60 + int(s)
        return result
    else:
        return 0


def seconds_to_time(time_original):
    # Translate seconds to time
    h = time_original // 3600
    m = time_original % 3600 // 60
    s = time_original % 60
    if h < 10:
        if h != 0:
            h = "0" + str(h)
    if m < 10:
        m = "0" + str(m)
    if s < 10:
        s = "0" + str(s)
    if h == 0:
        result = str(m) + ":" + str(s)
    else:
        result = str(h) + ":" + str(m) + ":" + str(s)
    print(result)
    return result


def two_string_equal(str1, str2):
    # Whether the two strings are equal
    if str1.strip == str2.strip:
        return True
    return False


def get_num_of_string(data, num):
    # Return the num of the string
    if len(data) < int(num):
        return data
    else:
        return data[0: int(num)]

# GetNumOfString("Aelius Maximus Decimus Meridius was a high ranking Roman general",10)
# SecondsToTime(32501)
# CalculateTime("1:1:20","59")
