#!/bin/bash
name="abigail"
item="rice"
price=5000
quantity=5

if [[ -z "$name" ]]; then
  name="client"
fi

subtotal=$(( price * quantity ))

if (( subtotal >= 100000 )); then
  discount_rate=10
elif (( subtotal >= 20000 )); then
  discount_rate=5
else
  discount_rate=0
fi

discount=$(( subtotal * discount_rate / 100 ))
taxable_amount=$(( subtotal - discount ))
vat=$(( taxable_amount * 1920 / 10000 ))
Total=$(( taxable_amount + vat ))

receipt_number=4821
receipt_date=$(date +"%d/%m/%Y %H:%M")

printf "========================\n"
printf "mokolo wholesale . receipt #%d\n" $receipt_number
printf "%s\n" "$receipt_date"
printf "========================\n"
printf "customer: %s\n" "$name"
printf "item: %s x %d\n" "$item" "$quantity"
printf "========================\n"
printf "subtotal: %d\n" $subtotal
printf "discount: %d\n" $discount
printf "vat: %d\n" $vat
printf "Total: %d\n" $Total

