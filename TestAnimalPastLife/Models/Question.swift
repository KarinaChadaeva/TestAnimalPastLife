//
//  Question.swift
//  TestAnimalPastLife
//
//  Created by Карина Чадаева on 03.02.23.
//

enum ResponseType {
    case single
    case multiple
    case range
}

struct Question {
    let text: String
    let type: ResponseType
    let answers: [Answer]
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
        Question(
            text: "Как бы тебя охарактеризовали друзья?",
            type: .single,
            answers: [
                Answer(text: "Добрый", type: .lion),
                Answer(text: "Веселый", type: .monkey),
                Answer(text: "Хитрый", type: .snake),
                Answer(text: "Ленивый", type: .sloth)
            ]
        ),
        Question(
            text: "Ты идешь по темной улице, а за тобой увязался подозрительный тип. Что будешь делать?",
            type: .single,
            answers: [
                Answer(text: "Сам на него нападу", type: .lion),
                Answer(text: "Спрячусь в кустах", type: .snake),
                Answer(text: "Попытаюсь убежать", type: .monkey),
                Answer(text: "Ничего", type: .sloth)
            ]
        ),
        Question(
            text: "В конце недели у тебя важный дедлайн по проекту. Что будешь делать?",
            type: .single,
            answers: [
                Answer(text: "Сделаю", type: .lion),
                Answer(text: "Займусь чем-нибудь другим", type: .monkey),
                Answer(text: "Буду прокрастинировать", type: .sloth),
                Answer(text: "Попрошу кого-нибудь помочь", type: .snake)
            ]
        ),
        Question(
            text: "Внезапная неделя отдыха для тебя это повод...",
            type: .multiple,
            answers: [
                Answer(text: "Сделать выжные дела", type: .snake),
                Answer(text: "Лежать пузом кверху", type: .sloth),
                Answer(text: "Увидеться с родными", type: .monkey),
                Answer(text: "Пойти тусить", type: .lion)
            ]
        ),
        Question(
            text: "Что будешь делать, если твой партнер забыл про вашу годовщину?",
            type: .range,
            answers: [
                Answer(text: "Устрою скандал", type: .snake),
                Answer(text: "Устрою скандал", type: .lion),
                Answer(text: "Прощу", type: .sloth),
                Answer(text: "Прощу", type: .monkey)
            ]
        )
        ]
    }
}
