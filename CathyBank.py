def scrore(scoreList):
    # 國泰補習班中，有五位學生期中考的成績分別為[53, 64, 75, 19, 92]，但是老師在輸入成績的時候看反了，把五位學生的成績改成了[35, 46, 57, 91, 29]，請用一個函數來將學生的成績修正。
    correct_scoreList = []
    for each_score in scoreList:
        units_digit = each_score % 10
        tens_digit = each_score // 10
        new_score = units_digit * 10 + tens_digit
        correct_scoreList.append(new_score)
    return correct_scoreList

def celebrate(celebrate_string):
    #國泰銀行要慶祝六十周年，需要買字母貼紙來布置活動空間，文字為"Hello welcome to Cathay 60th year anniversary"，請寫一個程式計算每個字母(大小寫視為同個字母)出現次數
    celebrate_string = celebrate_string.upper()
    caculate_string_dic = {}
    for i in range(len(celebrate_string)):
        if celebrate_string[i] in caculate_string_dic:
            caculate_string_dic[celebrate_string[i]] + 1
        else:
            caculate_string_dic[celebrate_string[i]] = 1
    return caculate_string_dic

def find_last_person(n):
    #QA部門今天舉辦團康活動，有n個人圍成一圈，順序排號。從第一個人開始報數（從1到3報數），凡報到3的人退出圈子。請利用一段程式計算出，最後留下的那位同事，是所有同事裡面的第幾順位?
    people = list(range(1, n + 1))
    index = 0
    while len(people) > 1:
        index = (index + 2) % len(people)
        people.pop(index)
    return people[0]