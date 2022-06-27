/* The percentage of the number of orders of a particular customer from the total number of orders per year. (CP with the input parameter of the customer).*/
delimiter //
CREATE procedure GetPercentZakaz(IN ID_Zakazchik_input INT unsigned)
BEGIN 
DECLARE all_count INT;
DECLARE zakazchik_orders_count INT;
Declare percent float;
SET all_count = (select count(*) from zakaz
     Where YEAR(DateZakaz) = YEAR(now()));
SET zakazchik_orders_count = (select count(*) from zakaz
     WHERE ID_Customer = ID_Zakazchik_input AND YEAR(DateZakaz) = YEAR(now()));
SET percent = ((zakazchik_orders_count * 100) / all_count);
SELECT concat(percent, '%');
END 
delimiter;
Call farmacy.GetPercentZakaz(1);


/*The cost of goods sold monthly (output of the table of months with the values of the amounts ordered for the month of goods) (CP without parameters).*/
delimiter //
CREATE PROCEDURE GetPriceMonth()
BEGIN 
SELECT MONTH(z.DateZakaz) as month, format(sum(zm.PriceOne * zm.AmountZakaz),2) as money
FROM zakaz z
     join zakazmed zm using(ID_Zakaz)
WHERE YEAR(z.DateZakaz) = YEAR(now())
GROUP BY month;
END;
delimiter;
CALL farmacy.GetPriceMonth();

/*Replace the name of orders with "Order name_Month of execution_Year of execution" (CP with the parameter Order name).*/
delimiter //
CREATE procedure ChangeZakazName(IN NewZakazName nvarchar(30))
BEGIN
update zakaz SET NameZakaz = concat(NewZakazName,'_',month(DateZakaz),'_',YEAR(DateZakaz));
END //
call farmacy.ChangeZakazName('ORDER');

