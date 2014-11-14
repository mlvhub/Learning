--pow _ 0 = 1
--pow m n = m * m `pow` (n - 1)
--pow m n = m * m `pow` n - 1
--pow m n = m * (pow) m (n - 1)
--pow m n = (m * m) `pow` (n - 1)
pow m 1 = m
pow m n = m * m `pow` (n - 1)
