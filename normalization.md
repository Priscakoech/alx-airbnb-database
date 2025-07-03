# Normalization steps

## objective
normalize the initial database schema to eliminate redundancy.

# 1NF
All columns contain atomic values; no sets, lists or repeating groups.
achieved in all tables

# 2NF
The schema is already in 1NF.
All non-key attributes are fully dependent on the primary key

# 3NF
The schema is in 2NF
There are no transitive dependencies.
few adjustments needed

# adjustments
Replace ENUMs ('User.role', 'Payment.payment_method') with lookup tables:
**Roles(role_id, role_name)**
**PaymentMethods(method_id, method_name)**

remove 'total_price' from booking if it's derivable


