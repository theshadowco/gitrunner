﻿// Реализация шагов BDD-фич/сценариев c помощью фреймворка https://github.com/artbear/1bdd

#Использовать asserts
#Использовать tempfiles

Перем БДД; //контекст фреймворка 1bdd

// Метод выдает список шагов, реализованных в данном файле-шагов
Функция ПолучитьСписокШагов(КонтекстФреймворкаBDD) Экспорт
	БДД = КонтекстФреймворкаBDD;
	
	ВсеШаги = Новый Массив;
	
	ВсеШаги.Добавить("ЯВыполняюПроизвольнуюКомандуGit");
	ВсеШаги.Добавить("ВыводКомандыСодержит");
	ВсеШаги.Добавить("ЯСообщаюВыводКоманды");
	
	Возврат ВсеШаги;
КонецФункции

// Реализация шагов

// Процедура выполняется перед запуском каждого сценария
Процедура ПередЗапускомСценария(Знач Узел) Экспорт
	
КонецПроцедуры

// Процедура выполняется после завершения каждого сценария
Процедура ПослеЗапускаСценария(Знач Узел) Экспорт
	
КонецПроцедуры

//Я выполняю произвольную команду git "status"
Процедура ЯВыполняюПроизвольнуюКомандуGit(Знач ТекстПроизвольнойКоманды) Экспорт
	
	ГитРепозиторий = БДД.ПолучитьИзКонтекста("ГитРепозиторий");
	
	ПараметрыКоманды = Новый Массив;
	ПараметрыКоманды = СтрРазделить(ТекстПроизвольнойКоманды, " ");
	
	ГитРепозиторий.ВыполнитьКоманду(ПараметрыКоманды);
	
КонецПроцедуры

//Вывод команды содержит ""
Процедура ВыводКомандыСодержит(Знач ОжидаемыйВыводКоманды) Экспорт
	ГитРепозиторий = БДД.ПолучитьИзКонтекста("ГитРепозиторий");
	
	ВыводКоманды = ГитРепозиторий.ПолучитьВыводКоманды();
	Ожидаем.Что(ВыводКоманды).Содержит(ОжидаемыйВыводКоманды);
КонецПроцедуры

//Я сообщаю вывод команды
Процедура ЯСообщаюВыводКоманды() Экспорт
	ГитРепозиторий = БДД.ПолучитьИзКонтекста("ГитРепозиторий");
	
	ВыводКоманды = ГитРепозиторий.ПолучитьВыводКоманды();
	Сообщить(ВыводКоманды);

КонецПроцедуры
