//
//  CommonStrings.swift
//  Education
//
//  Created by Admin on 20.03.2021.
//

import Foundation

enum CommonStrings: String, Localizable {
    
    ///Название дисциплины
    case lessonTitle
    //Аудитoрные занятия в часах
    case classLessonsTitle
    ///План обучения
    case studyPlanTitle
    ///Индивидуальный учебный план
    case individualPlan
    ///2018-2019 учебный год
    case studyYear20182019
    
    var prefix: String? {
        return "common"
    }
}

