# JOB Benchmark Query Analysis
## Join Equivalence Classes and Hypergraphs

### Query: 10a.sql

**Tables:**
- cast_info AS ci
- char_name AS chn
- company_name AS cn
- company_type AS ct
- movie_companies AS mc
- role_type AS rt
- title AS t

**Join Conditions:**
- t.id = mc.movie_id
- t.id = ci.movie_id
- ci.movie_id = mc.movie_id
- chn.id = ci.person_role_id
- rt.id = ci.role_id
- cn.id = mc.company_id
- ct.id = mc.company_type_id

**Equivalence Classes:**
- Class 1: {ci.role_id, rt.id}
- Class 2: {ci.movie_id, mc.movie_id, t.id}
- Class 3: {chn.id, ci.person_role_id}
- Class 4: {ct.id, mc.company_type_id}
- Class 5: {cn.id, mc.company_id}

**Hypergraph:**
- Nodes (tables): {chn, ci, cn, ct, mc, rt, t}
- Hyperedges:
  - Edge 1: Tables {ci, rt} via attributes {ci.role_id, rt.id}
  - Edge 2: Tables {ci, mc, t} via attributes {ci.movie_id, mc.movie_id, t.id}
  - Edge 3: Tables {chn, ci} via attributes {chn.id, ci.person_role_id}
  - Edge 4: Tables {ct, mc} via attributes {ct.id, mc.company_type_id}
  - Edge 5: Tables {cn, mc} via attributes {cn.id, mc.company_id}

---

### Query: 11a.sql

**Tables:**
- company_name AS cn
- company_type AS ct
- keyword AS k
- link_type AS lt
- movie_companies AS mc
- movie_keyword AS mk
- movie_link AS ml
- title AS t

**Join Conditions:**
- lt.id = ml.link_type_id
- ml.movie_id = t.id
- t.id = mk.movie_id
- mk.keyword_id = k.id
- t.id = mc.movie_id
- mc.company_type_id = ct.id
- mc.company_id = cn.id
- ml.movie_id = mk.movie_id
- ml.movie_id = mc.movie_id
- mk.movie_id = mc.movie_id

**Equivalence Classes:**
- Class 1: {lt.id, ml.link_type_id}
- Class 2: {k.id, mk.keyword_id}
- Class 3: {mc.movie_id, mk.movie_id, ml.movie_id, t.id}
- Class 4: {ct.id, mc.company_type_id}
- Class 5: {cn.id, mc.company_id}

**Hypergraph:**
- Nodes (tables): {cn, ct, k, lt, mc, mk, ml, t}
- Hyperedges:
  - Edge 1: Tables {lt, ml} via attributes {lt.id, ml.link_type_id}
  - Edge 2: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 3: Tables {mc, mk, ml, t} via attributes {mc.movie_id, mk.movie_id, ml.movie_id, t.id}
  - Edge 4: Tables {ct, mc} via attributes {ct.id, mc.company_type_id}
  - Edge 5: Tables {cn, mc} via attributes {cn.id, mc.company_id}

---

### Query: 12a.sql

**Tables:**
- company_name AS cn
- company_type AS ct
- info_type AS it1
- info_type AS it2
- movie_companies AS mc
- movie_info AS mi
- movie_info_idx AS mi_idx
- title AS t

**Join Conditions:**
- t.id = mi.movie_id
- t.id = mi_idx.movie_id
- mi.info_type_id = it1.id
- mi_idx.info_type_id = it2.id
- t.id = mc.movie_id
- ct.id = mc.company_type_id
- cn.id = mc.company_id
- mc.movie_id = mi.movie_id
- mc.movie_id = mi_idx.movie_id
- mi.movie_id = mi_idx.movie_id

**Equivalence Classes:**
- Class 1: {it1.id, mi.info_type_id}
- Class 2: {mc.movie_id, mi.movie_id, mi_idx.movie_id, t.id}
- Class 3: {it2.id, mi_idx.info_type_id}
- Class 4: {ct.id, mc.company_type_id}
- Class 5: {cn.id, mc.company_id}

**Hypergraph:**
- Nodes (tables): {cn, ct, it1, it2, mc, mi, mi_idx, t}
- Hyperedges:
  - Edge 1: Tables {it1, mi} via attributes {it1.id, mi.info_type_id}
  - Edge 2: Tables {mc, mi, mi_idx, t} via attributes {mc.movie_id, mi.movie_id, mi_idx.movie_id, t.id}
  - Edge 3: Tables {it2, mi_idx} via attributes {it2.id, mi_idx.info_type_id}
  - Edge 4: Tables {ct, mc} via attributes {ct.id, mc.company_type_id}
  - Edge 5: Tables {cn, mc} via attributes {cn.id, mc.company_id}

---

### Query: 13a.sql

**Tables:**
- company_name AS cn
- company_type AS ct
- info_type AS it
- info_type AS it2
- kind_type AS kt
- movie_companies AS mc
- movie_info AS mi
- movie_info_idx AS miidx
- title AS t

**Join Conditions:**
- mi.movie_id = t.id
- it2.id = mi.info_type_id
- kt.id = t.kind_id
- mc.movie_id = t.id
- cn.id = mc.company_id
- ct.id = mc.company_type_id
- miidx.movie_id = t.id
- it.id = miidx.info_type_id
- mi.movie_id = miidx.movie_id
- mi.movie_id = mc.movie_id
- miidx.movie_id = mc.movie_id

**Equivalence Classes:**
- Class 1: {it2.id, mi.info_type_id}
- Class 2: {it.id, miidx.info_type_id}
- Class 3: {mc.movie_id, mi.movie_id, miidx.movie_id, t.id}
- Class 4: {kt.id, t.kind_id}
- Class 5: {ct.id, mc.company_type_id}
- Class 6: {cn.id, mc.company_id}

**Hypergraph:**
- Nodes (tables): {cn, ct, it, it2, kt, mc, mi, miidx, t}
- Hyperedges:
  - Edge 1: Tables {it2, mi} via attributes {it2.id, mi.info_type_id}
  - Edge 2: Tables {it, miidx} via attributes {it.id, miidx.info_type_id}
  - Edge 3: Tables {mc, mi, miidx, t} via attributes {mc.movie_id, mi.movie_id, miidx.movie_id, t.id}
  - Edge 4: Tables {kt, t} via attributes {kt.id, t.kind_id}
  - Edge 5: Tables {ct, mc} via attributes {ct.id, mc.company_type_id}
  - Edge 6: Tables {cn, mc} via attributes {cn.id, mc.company_id}

---

### Query: 14a.sql

**Tables:**
- info_type AS it1
- info_type AS it2
- keyword AS k
- kind_type AS kt
- movie_info AS mi
- movie_info_idx AS mi_idx
- movie_keyword AS mk
- title AS t

**Join Conditions:**
- kt.id = t.kind_id
- t.id = mi.movie_id
- t.id = mk.movie_id
- t.id = mi_idx.movie_id
- mk.movie_id = mi.movie_id
- mk.movie_id = mi_idx.movie_id
- mi.movie_id = mi_idx.movie_id
- k.id = mk.keyword_id
- it1.id = mi.info_type_id
- it2.id = mi_idx.info_type_id

**Equivalence Classes:**
- Class 1: {k.id, mk.keyword_id}
- Class 2: {it1.id, mi.info_type_id}
- Class 3: {mi.movie_id, mi_idx.movie_id, mk.movie_id, t.id}
- Class 4: {kt.id, t.kind_id}
- Class 5: {it2.id, mi_idx.info_type_id}

**Hypergraph:**
- Nodes (tables): {it1, it2, k, kt, mi, mi_idx, mk, t}
- Hyperedges:
  - Edge 1: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 2: Tables {it1, mi} via attributes {it1.id, mi.info_type_id}
  - Edge 3: Tables {mi, mi_idx, mk, t} via attributes {mi.movie_id, mi_idx.movie_id, mk.movie_id, t.id}
  - Edge 4: Tables {kt, t} via attributes {kt.id, t.kind_id}
  - Edge 5: Tables {it2, mi_idx} via attributes {it2.id, mi_idx.info_type_id}

---

### Query: 15a.sql

**Tables:**
- aka_title AS at
- company_name AS cn
- company_type AS ct
- info_type AS it1
- keyword AS k
- movie_companies AS mc
- movie_info AS mi
- movie_keyword AS mk
- title AS t

**Join Conditions:**
- t.id = at.movie_id
- t.id = mi.movie_id
- t.id = mk.movie_id
- t.id = mc.movie_id
- mk.movie_id = mi.movie_id
- mk.movie_id = mc.movie_id
- mk.movie_id = at.movie_id
- mi.movie_id = mc.movie_id
- mi.movie_id = at.movie_id
- mc.movie_id = at.movie_id
- k.id = mk.keyword_id
- it1.id = mi.info_type_id
- cn.id = mc.company_id
- ct.id = mc.company_type_id

**Equivalence Classes:**
- Class 1: {k.id, mk.keyword_id}
- Class 2: {it1.id, mi.info_type_id}
- Class 3: {at.movie_id, mc.movie_id, mi.movie_id, mk.movie_id, t.id}
- Class 4: {ct.id, mc.company_type_id}
- Class 5: {cn.id, mc.company_id}

**Hypergraph:**
- Nodes (tables): {at, cn, ct, it1, k, mc, mi, mk, t}
- Hyperedges:
  - Edge 1: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 2: Tables {it1, mi} via attributes {it1.id, mi.info_type_id}
  - Edge 3: Tables {at, mc, mi, mk, t} via attributes {at.movie_id, mc.movie_id, mi.movie_id, mk.movie_id, t.id}
  - Edge 4: Tables {ct, mc} via attributes {ct.id, mc.company_type_id}
  - Edge 5: Tables {cn, mc} via attributes {cn.id, mc.company_id}

---

### Query: 16a.sql

**Tables:**
- aka_name AS an
- cast_info AS ci
- company_name AS cn
- keyword AS k
- movie_companies AS mc
- movie_keyword AS mk
- name AS n
- title AS t

**Join Conditions:**
- an.person_id = n.id
- n.id = ci.person_id
- ci.movie_id = t.id
- t.id = mk.movie_id
- mk.keyword_id = k.id
- t.id = mc.movie_id
- mc.company_id = cn.id
- an.person_id = ci.person_id
- ci.movie_id = mc.movie_id
- ci.movie_id = mk.movie_id
- mc.movie_id = mk.movie_id

**Equivalence Classes:**
- Class 1: {an.person_id, ci.person_id, n.id}
- Class 2: {k.id, mk.keyword_id}
- Class 3: {ci.movie_id, mc.movie_id, mk.movie_id, t.id}
- Class 4: {cn.id, mc.company_id}

**Hypergraph:**
- Nodes (tables): {an, ci, cn, k, mc, mk, n, t}
- Hyperedges:
  - Edge 1: Tables {an, ci, n} via attributes {an.person_id, ci.person_id, n.id}
  - Edge 2: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 3: Tables {ci, mc, mk, t} via attributes {ci.movie_id, mc.movie_id, mk.movie_id, t.id}
  - Edge 4: Tables {cn, mc} via attributes {cn.id, mc.company_id}

---

### Query: 17a.sql

**Tables:**
- cast_info AS ci
- company_name AS cn
- keyword AS k
- movie_companies AS mc
- movie_keyword AS mk
- name AS n
- title AS t

**Join Conditions:**
- n.id = ci.person_id
- ci.movie_id = t.id
- t.id = mk.movie_id
- mk.keyword_id = k.id
- t.id = mc.movie_id
- mc.company_id = cn.id
- ci.movie_id = mc.movie_id
- ci.movie_id = mk.movie_id
- mc.movie_id = mk.movie_id

**Equivalence Classes:**
- Class 1: {ci.person_id, n.id}
- Class 2: {k.id, mk.keyword_id}
- Class 3: {ci.movie_id, mc.movie_id, mk.movie_id, t.id}
- Class 4: {cn.id, mc.company_id}

**Hypergraph:**
- Nodes (tables): {ci, cn, k, mc, mk, n, t}
- Hyperedges:
  - Edge 1: Tables {ci, n} via attributes {ci.person_id, n.id}
  - Edge 2: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 3: Tables {ci, mc, mk, t} via attributes {ci.movie_id, mc.movie_id, mk.movie_id, t.id}
  - Edge 4: Tables {cn, mc} via attributes {cn.id, mc.company_id}

---

### Query: 18a.sql

**Tables:**
- cast_info AS ci
- info_type AS it1
- info_type AS it2
- movie_info AS mi
- movie_info_idx AS mi_idx
- name AS n
- title AS t

**Join Conditions:**
- t.id = mi.movie_id
- t.id = mi_idx.movie_id
- t.id = ci.movie_id
- ci.movie_id = mi.movie_id
- ci.movie_id = mi_idx.movie_id
- mi.movie_id = mi_idx.movie_id
- n.id = ci.person_id
- it1.id = mi.info_type_id
- it2.id = mi_idx.info_type_id

**Equivalence Classes:**
- Class 1: {ci.person_id, n.id}
- Class 2: {it1.id, mi.info_type_id}
- Class 3: {ci.movie_id, mi.movie_id, mi_idx.movie_id, t.id}
- Class 4: {it2.id, mi_idx.info_type_id}

**Hypergraph:**
- Nodes (tables): {ci, it1, it2, mi, mi_idx, n, t}
- Hyperedges:
  - Edge 1: Tables {ci, n} via attributes {ci.person_id, n.id}
  - Edge 2: Tables {it1, mi} via attributes {it1.id, mi.info_type_id}
  - Edge 3: Tables {ci, mi, mi_idx, t} via attributes {ci.movie_id, mi.movie_id, mi_idx.movie_id, t.id}
  - Edge 4: Tables {it2, mi_idx} via attributes {it2.id, mi_idx.info_type_id}

---

### Query: 19a.sql

**Tables:**
- aka_name AS an
- cast_info AS ci
- char_name AS chn
- company_name AS cn
- info_type AS it
- movie_companies AS mc
- movie_info AS mi
- name AS n
- role_type AS rt
- title AS t

**Join Conditions:**
- t.id = mi.movie_id
- t.id = mc.movie_id
- t.id = ci.movie_id
- mc.movie_id = ci.movie_id
- mc.movie_id = mi.movie_id
- mi.movie_id = ci.movie_id
- cn.id = mc.company_id
- it.id = mi.info_type_id
- n.id = ci.person_id
- rt.id = ci.role_id
- n.id = an.person_id
- ci.person_id = an.person_id
- chn.id = ci.person_role_id

**Equivalence Classes:**
- Class 1: {ci.role_id, rt.id}
- Class 2: {it.id, mi.info_type_id}
- Class 3: {an.person_id, ci.person_id, n.id}
- Class 4: {ci.movie_id, mc.movie_id, mi.movie_id, t.id}
- Class 5: {chn.id, ci.person_role_id}
- Class 6: {cn.id, mc.company_id}

**Hypergraph:**
- Nodes (tables): {an, chn, ci, cn, it, mc, mi, n, rt, t}
- Hyperedges:
  - Edge 1: Tables {ci, rt} via attributes {ci.role_id, rt.id}
  - Edge 2: Tables {it, mi} via attributes {it.id, mi.info_type_id}
  - Edge 3: Tables {an, ci, n} via attributes {an.person_id, ci.person_id, n.id}
  - Edge 4: Tables {ci, mc, mi, t} via attributes {ci.movie_id, mc.movie_id, mi.movie_id, t.id}
  - Edge 5: Tables {chn, ci} via attributes {chn.id, ci.person_role_id}
  - Edge 6: Tables {cn, mc} via attributes {cn.id, mc.company_id}

---

### Query: 1a.sql

**Tables:**
- company_type AS ct
- info_type AS it
- movie_companies AS mc
- movie_info_idx AS mi_idx
- title AS t

**Join Conditions:**
- ct.id = mc.company_type_id
- t.id = mc.movie_id
- t.id = mi_idx.movie_id
- mc.movie_id = mi_idx.movie_id
- it.id = mi_idx.info_type_id

**Equivalence Classes:**
- Class 1: {mc.movie_id, mi_idx.movie_id, t.id}
- Class 2: {it.id, mi_idx.info_type_id}
- Class 3: {ct.id, mc.company_type_id}

**Hypergraph:**
- Nodes (tables): {ct, it, mc, mi_idx, t}
- Hyperedges:
  - Edge 1: Tables {mc, mi_idx, t} via attributes {mc.movie_id, mi_idx.movie_id, t.id}
  - Edge 2: Tables {it, mi_idx} via attributes {it.id, mi_idx.info_type_id}
  - Edge 3: Tables {ct, mc} via attributes {ct.id, mc.company_type_id}

---

### Query: 20a.sql

**Tables:**
- cast_info AS ci
- char_name AS chn
- comp_cast_type AS cct1
- comp_cast_type AS cct2
- complete_cast AS cc
- keyword AS k
- kind_type AS kt
- movie_keyword AS mk
- name AS n
- title AS t

**Join Conditions:**
- kt.id = t.kind_id
- t.id = mk.movie_id
- t.id = ci.movie_id
- t.id = cc.movie_id
- mk.movie_id = ci.movie_id
- mk.movie_id = cc.movie_id
- ci.movie_id = cc.movie_id
- chn.id = ci.person_role_id
- n.id = ci.person_id
- k.id = mk.keyword_id
- cct1.id = cc.subject_id
- cct2.id = cc.status_id

**Equivalence Classes:**
- Class 1: {ci.person_id, n.id}
- Class 2: {k.id, mk.keyword_id}
- Class 3: {cc.movie_id, ci.movie_id, mk.movie_id, t.id}
- Class 4: {kt.id, t.kind_id}
- Class 5: {chn.id, ci.person_role_id}
- Class 6: {cc.subject_id, cct1.id}
- Class 7: {cc.status_id, cct2.id}

**Hypergraph:**
- Nodes (tables): {cc, cct1, cct2, chn, ci, k, kt, mk, n, t}
- Hyperedges:
  - Edge 1: Tables {ci, n} via attributes {ci.person_id, n.id}
  - Edge 2: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 3: Tables {cc, ci, mk, t} via attributes {cc.movie_id, ci.movie_id, mk.movie_id, t.id}
  - Edge 4: Tables {kt, t} via attributes {kt.id, t.kind_id}
  - Edge 5: Tables {chn, ci} via attributes {chn.id, ci.person_role_id}
  - Edge 6: Tables {cc, cct1} via attributes {cc.subject_id, cct1.id}
  - Edge 7: Tables {cc, cct2} via attributes {cc.status_id, cct2.id}

---

### Query: 21a.sql

**Tables:**
- company_name AS cn
- company_type AS ct
- keyword AS k
- link_type AS lt
- movie_companies AS mc
- movie_info AS mi
- movie_keyword AS mk
- movie_link AS ml
- title AS t

**Join Conditions:**
- lt.id = ml.link_type_id
- ml.movie_id = t.id
- t.id = mk.movie_id
- mk.keyword_id = k.id
- t.id = mc.movie_id
- mc.company_type_id = ct.id
- mc.company_id = cn.id
- mi.movie_id = t.id
- ml.movie_id = mk.movie_id
- ml.movie_id = mc.movie_id
- mk.movie_id = mc.movie_id
- ml.movie_id = mi.movie_id
- mk.movie_id = mi.movie_id
- mc.movie_id = mi.movie_id

**Equivalence Classes:**
- Class 1: {lt.id, ml.link_type_id}
- Class 2: {k.id, mk.keyword_id}
- Class 3: {mc.movie_id, mi.movie_id, mk.movie_id, ml.movie_id, t.id}
- Class 4: {ct.id, mc.company_type_id}
- Class 5: {cn.id, mc.company_id}

**Hypergraph:**
- Nodes (tables): {cn, ct, k, lt, mc, mi, mk, ml, t}
- Hyperedges:
  - Edge 1: Tables {lt, ml} via attributes {lt.id, ml.link_type_id}
  - Edge 2: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 3: Tables {mc, mi, mk, ml, t} via attributes {mc.movie_id, mi.movie_id, mk.movie_id, ml.movie_id, t.id}
  - Edge 4: Tables {ct, mc} via attributes {ct.id, mc.company_type_id}
  - Edge 5: Tables {cn, mc} via attributes {cn.id, mc.company_id}

---

### Query: 22a.sql

**Tables:**
- company_name AS cn
- company_type AS ct
- info_type AS it1
- info_type AS it2
- keyword AS k
- kind_type AS kt
- movie_companies AS mc
- movie_info AS mi
- movie_info_idx AS mi_idx
- movie_keyword AS mk
- title AS t

**Join Conditions:**
- kt.id = t.kind_id
- t.id = mi.movie_id
- t.id = mk.movie_id
- t.id = mi_idx.movie_id
- t.id = mc.movie_id
- mk.movie_id = mi.movie_id
- mk.movie_id = mi_idx.movie_id
- mk.movie_id = mc.movie_id
- mi.movie_id = mi_idx.movie_id
- mi.movie_id = mc.movie_id
- mc.movie_id = mi_idx.movie_id
- k.id = mk.keyword_id
- it1.id = mi.info_type_id
- it2.id = mi_idx.info_type_id
- ct.id = mc.company_type_id
- cn.id = mc.company_id

**Equivalence Classes:**
- Class 1: {k.id, mk.keyword_id}
- Class 2: {it1.id, mi.info_type_id}
- Class 3: {mc.movie_id, mi.movie_id, mi_idx.movie_id, mk.movie_id, t.id}
- Class 4: {kt.id, t.kind_id}
- Class 5: {it2.id, mi_idx.info_type_id}
- Class 6: {ct.id, mc.company_type_id}
- Class 7: {cn.id, mc.company_id}

**Hypergraph:**
- Nodes (tables): {cn, ct, it1, it2, k, kt, mc, mi, mi_idx, mk, t}
- Hyperedges:
  - Edge 1: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 2: Tables {it1, mi} via attributes {it1.id, mi.info_type_id}
  - Edge 3: Tables {mc, mi, mi_idx, mk, t} via attributes {mc.movie_id, mi.movie_id, mi_idx.movie_id, mk.movie_id, t.id}
  - Edge 4: Tables {kt, t} via attributes {kt.id, t.kind_id}
  - Edge 5: Tables {it2, mi_idx} via attributes {it2.id, mi_idx.info_type_id}
  - Edge 6: Tables {ct, mc} via attributes {ct.id, mc.company_type_id}
  - Edge 7: Tables {cn, mc} via attributes {cn.id, mc.company_id}

---

### Query: 23a.sql

**Tables:**
- comp_cast_type AS cct1
- company_name AS cn
- company_type AS ct
- complete_cast AS cc
- info_type AS it1
- keyword AS k
- kind_type AS kt
- movie_companies AS mc
- movie_info AS mi
- movie_keyword AS mk
- title AS t

**Join Conditions:**
- kt.id = t.kind_id
- t.id = mi.movie_id
- t.id = mk.movie_id
- t.id = mc.movie_id
- t.id = cc.movie_id
- mk.movie_id = mi.movie_id
- mk.movie_id = mc.movie_id
- mk.movie_id = cc.movie_id
- mi.movie_id = mc.movie_id
- mi.movie_id = cc.movie_id
- mc.movie_id = cc.movie_id
- k.id = mk.keyword_id
- it1.id = mi.info_type_id
- cn.id = mc.company_id
- ct.id = mc.company_type_id
- cct1.id = cc.status_id

**Equivalence Classes:**
- Class 1: {k.id, mk.keyword_id}
- Class 2: {it1.id, mi.info_type_id}
- Class 3: {cc.movie_id, mc.movie_id, mi.movie_id, mk.movie_id, t.id}
- Class 4: {kt.id, t.kind_id}
- Class 5: {ct.id, mc.company_type_id}
- Class 6: {cc.status_id, cct1.id}
- Class 7: {cn.id, mc.company_id}

**Hypergraph:**
- Nodes (tables): {cc, cct1, cn, ct, it1, k, kt, mc, mi, mk, t}
- Hyperedges:
  - Edge 1: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 2: Tables {it1, mi} via attributes {it1.id, mi.info_type_id}
  - Edge 3: Tables {cc, mc, mi, mk, t} via attributes {cc.movie_id, mc.movie_id, mi.movie_id, mk.movie_id, t.id}
  - Edge 4: Tables {kt, t} via attributes {kt.id, t.kind_id}
  - Edge 5: Tables {ct, mc} via attributes {ct.id, mc.company_type_id}
  - Edge 6: Tables {cc, cct1} via attributes {cc.status_id, cct1.id}
  - Edge 7: Tables {cn, mc} via attributes {cn.id, mc.company_id}

---

### Query: 24a.sql

**Tables:**
- aka_name AS an
- cast_info AS ci
- char_name AS chn
- company_name AS cn
- info_type AS it
- keyword AS k
- movie_companies AS mc
- movie_info AS mi
- movie_keyword AS mk
- name AS n
- role_type AS rt
- title AS t

**Join Conditions:**
- t.id = mi.movie_id
- t.id = mc.movie_id
- t.id = ci.movie_id
- t.id = mk.movie_id
- mc.movie_id = ci.movie_id
- mc.movie_id = mi.movie_id
- mc.movie_id = mk.movie_id
- mi.movie_id = ci.movie_id
- mi.movie_id = mk.movie_id
- ci.movie_id = mk.movie_id
- cn.id = mc.company_id
- it.id = mi.info_type_id
- n.id = ci.person_id
- rt.id = ci.role_id
- n.id = an.person_id
- ci.person_id = an.person_id
- chn.id = ci.person_role_id
- k.id = mk.keyword_id

**Equivalence Classes:**
- Class 1: {ci.role_id, rt.id}
- Class 2: {it.id, mi.info_type_id}
- Class 3: {an.person_id, ci.person_id, n.id}
- Class 4: {k.id, mk.keyword_id}
- Class 5: {ci.movie_id, mc.movie_id, mi.movie_id, mk.movie_id, t.id}
- Class 6: {chn.id, ci.person_role_id}
- Class 7: {cn.id, mc.company_id}

**Hypergraph:**
- Nodes (tables): {an, chn, ci, cn, it, k, mc, mi, mk, n, rt, t}
- Hyperedges:
  - Edge 1: Tables {ci, rt} via attributes {ci.role_id, rt.id}
  - Edge 2: Tables {it, mi} via attributes {it.id, mi.info_type_id}
  - Edge 3: Tables {an, ci, n} via attributes {an.person_id, ci.person_id, n.id}
  - Edge 4: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 5: Tables {ci, mc, mi, mk, t} via attributes {ci.movie_id, mc.movie_id, mi.movie_id, mk.movie_id, t.id}
  - Edge 6: Tables {chn, ci} via attributes {chn.id, ci.person_role_id}
  - Edge 7: Tables {cn, mc} via attributes {cn.id, mc.company_id}

---

### Query: 25a.sql

**Tables:**
- cast_info AS ci
- info_type AS it1
- info_type AS it2
- keyword AS k
- movie_info AS mi
- movie_info_idx AS mi_idx
- movie_keyword AS mk
- name AS n
- title AS t

**Join Conditions:**
- t.id = mi.movie_id
- t.id = mi_idx.movie_id
- t.id = ci.movie_id
- t.id = mk.movie_id
- ci.movie_id = mi.movie_id
- ci.movie_id = mi_idx.movie_id
- ci.movie_id = mk.movie_id
- mi.movie_id = mi_idx.movie_id
- mi.movie_id = mk.movie_id
- mi_idx.movie_id = mk.movie_id
- n.id = ci.person_id
- it1.id = mi.info_type_id
- it2.id = mi_idx.info_type_id
- k.id = mk.keyword_id

**Equivalence Classes:**
- Class 1: {ci.person_id, n.id}
- Class 2: {it1.id, mi.info_type_id}
- Class 3: {k.id, mk.keyword_id}
- Class 4: {ci.movie_id, mi.movie_id, mi_idx.movie_id, mk.movie_id, t.id}
- Class 5: {it2.id, mi_idx.info_type_id}

**Hypergraph:**
- Nodes (tables): {ci, it1, it2, k, mi, mi_idx, mk, n, t}
- Hyperedges:
  - Edge 1: Tables {ci, n} via attributes {ci.person_id, n.id}
  - Edge 2: Tables {it1, mi} via attributes {it1.id, mi.info_type_id}
  - Edge 3: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 4: Tables {ci, mi, mi_idx, mk, t} via attributes {ci.movie_id, mi.movie_id, mi_idx.movie_id, mk.movie_id, t.id}
  - Edge 5: Tables {it2, mi_idx} via attributes {it2.id, mi_idx.info_type_id}

---

### Query: 26a.sql

**Tables:**
- cast_info AS ci
- char_name AS chn
- comp_cast_type AS cct1
- comp_cast_type AS cct2
- complete_cast AS cc
- info_type AS it2
- keyword AS k
- kind_type AS kt
- movie_info_idx AS mi_idx
- movie_keyword AS mk
- name AS n
- title AS t

**Join Conditions:**
- kt.id = t.kind_id
- t.id = mk.movie_id
- t.id = ci.movie_id
- t.id = cc.movie_id
- t.id = mi_idx.movie_id
- mk.movie_id = ci.movie_id
- mk.movie_id = cc.movie_id
- mk.movie_id = mi_idx.movie_id
- ci.movie_id = cc.movie_id
- ci.movie_id = mi_idx.movie_id
- cc.movie_id = mi_idx.movie_id
- chn.id = ci.person_role_id
- n.id = ci.person_id
- k.id = mk.keyword_id
- cct1.id = cc.subject_id
- cct2.id = cc.status_id
- it2.id = mi_idx.info_type_id

**Equivalence Classes:**
- Class 1: {cc.subject_id, cct1.id}
- Class 2: {cc.movie_id, ci.movie_id, mi_idx.movie_id, mk.movie_id, t.id}
- Class 3: {kt.id, t.kind_id}
- Class 4: {k.id, mk.keyword_id}
- Class 5: {ci.person_id, n.id}
- Class 6: {cc.status_id, cct2.id}
- Class 7: {chn.id, ci.person_role_id}
- Class 8: {it2.id, mi_idx.info_type_id}

**Hypergraph:**
- Nodes (tables): {cc, cct1, cct2, chn, ci, it2, k, kt, mi_idx, mk, n, t}
- Hyperedges:
  - Edge 1: Tables {cc, cct1} via attributes {cc.subject_id, cct1.id}
  - Edge 2: Tables {cc, ci, mi_idx, mk, t} via attributes {cc.movie_id, ci.movie_id, mi_idx.movie_id, mk.movie_id, t.id}
  - Edge 3: Tables {kt, t} via attributes {kt.id, t.kind_id}
  - Edge 4: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 5: Tables {ci, n} via attributes {ci.person_id, n.id}
  - Edge 6: Tables {cc, cct2} via attributes {cc.status_id, cct2.id}
  - Edge 7: Tables {chn, ci} via attributes {chn.id, ci.person_role_id}
  - Edge 8: Tables {it2, mi_idx} via attributes {it2.id, mi_idx.info_type_id}

---

### Query: 27a.sql

**Tables:**
- comp_cast_type AS cct1
- comp_cast_type AS cct2
- company_name AS cn
- company_type AS ct
- complete_cast AS cc
- keyword AS k
- link_type AS lt
- movie_companies AS mc
- movie_info AS mi
- movie_keyword AS mk
- movie_link AS ml
- title AS t

**Join Conditions:**
- lt.id = ml.link_type_id
- ml.movie_id = t.id
- t.id = mk.movie_id
- mk.keyword_id = k.id
- t.id = mc.movie_id
- mc.company_type_id = ct.id
- mc.company_id = cn.id
- mi.movie_id = t.id
- t.id = cc.movie_id
- cct1.id = cc.subject_id
- cct2.id = cc.status_id
- ml.movie_id = mk.movie_id
- ml.movie_id = mc.movie_id
- mk.movie_id = mc.movie_id
- ml.movie_id = mi.movie_id
- mk.movie_id = mi.movie_id
- mc.movie_id = mi.movie_id
- ml.movie_id = cc.movie_id
- mk.movie_id = cc.movie_id
- mc.movie_id = cc.movie_id
- mi.movie_id = cc.movie_id

**Equivalence Classes:**
- Class 1: {lt.id, ml.link_type_id}
- Class 2: {k.id, mk.keyword_id}
- Class 3: {cc.movie_id, mc.movie_id, mi.movie_id, mk.movie_id, ml.movie_id, t.id}
- Class 4: {ct.id, mc.company_type_id}
- Class 5: {cc.subject_id, cct1.id}
- Class 6: {cc.status_id, cct2.id}
- Class 7: {cn.id, mc.company_id}

**Hypergraph:**
- Nodes (tables): {cc, cct1, cct2, cn, ct, k, lt, mc, mi, mk, ml, t}
- Hyperedges:
  - Edge 1: Tables {lt, ml} via attributes {lt.id, ml.link_type_id}
  - Edge 2: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 3: Tables {cc, mc, mi, mk, ml, t} via attributes {cc.movie_id, mc.movie_id, mi.movie_id, mk.movie_id, ml.movie_id, t.id}
  - Edge 4: Tables {ct, mc} via attributes {ct.id, mc.company_type_id}
  - Edge 5: Tables {cc, cct1} via attributes {cc.subject_id, cct1.id}
  - Edge 6: Tables {cc, cct2} via attributes {cc.status_id, cct2.id}
  - Edge 7: Tables {cn, mc} via attributes {cn.id, mc.company_id}

---

### Query: 28a.sql

**Tables:**
- comp_cast_type AS cct1
- comp_cast_type AS cct2
- company_name AS cn
- company_type AS ct
- complete_cast AS cc
- info_type AS it1
- info_type AS it2
- keyword AS k
- kind_type AS kt
- movie_companies AS mc
- movie_info AS mi
- movie_info_idx AS mi_idx
- movie_keyword AS mk
- title AS t

**Join Conditions:**
- kt.id = t.kind_id
- t.id = mi.movie_id
- t.id = mk.movie_id
- t.id = mi_idx.movie_id
- t.id = mc.movie_id
- t.id = cc.movie_id
- mk.movie_id = mi.movie_id
- mk.movie_id = mi_idx.movie_id
- mk.movie_id = mc.movie_id
- mk.movie_id = cc.movie_id
- mi.movie_id = mi_idx.movie_id
- mi.movie_id = mc.movie_id
- mi.movie_id = cc.movie_id
- mc.movie_id = mi_idx.movie_id
- mc.movie_id = cc.movie_id
- mi_idx.movie_id = cc.movie_id
- k.id = mk.keyword_id
- it1.id = mi.info_type_id
- it2.id = mi_idx.info_type_id
- ct.id = mc.company_type_id
- cn.id = mc.company_id
- cct1.id = cc.subject_id
- cct2.id = cc.status_id

**Equivalence Classes:**
- Class 1: {cc.subject_id, cct1.id}
- Class 2: {ct.id, mc.company_type_id}
- Class 3: {kt.id, t.kind_id}
- Class 4: {cc.movie_id, mc.movie_id, mi.movie_id, mi_idx.movie_id, mk.movie_id, t.id}
- Class 5: {k.id, mk.keyword_id}
- Class 6: {it1.id, mi.info_type_id}
- Class 7: {cc.status_id, cct2.id}
- Class 8: {cn.id, mc.company_id}
- Class 9: {it2.id, mi_idx.info_type_id}

**Hypergraph:**
- Nodes (tables): {cc, cct1, cct2, cn, ct, it1, it2, k, kt, mc, mi, mi_idx, mk, t}
- Hyperedges:
  - Edge 1: Tables {cc, cct1} via attributes {cc.subject_id, cct1.id}
  - Edge 2: Tables {ct, mc} via attributes {ct.id, mc.company_type_id}
  - Edge 3: Tables {kt, t} via attributes {kt.id, t.kind_id}
  - Edge 4: Tables {cc, mc, mi, mi_idx, mk, t} via attributes {cc.movie_id, mc.movie_id, mi.movie_id, mi_idx.movie_id, mk.movie_id, t.id}
  - Edge 5: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 6: Tables {it1, mi} via attributes {it1.id, mi.info_type_id}
  - Edge 7: Tables {cc, cct2} via attributes {cc.status_id, cct2.id}
  - Edge 8: Tables {cn, mc} via attributes {cn.id, mc.company_id}
  - Edge 9: Tables {it2, mi_idx} via attributes {it2.id, mi_idx.info_type_id}

---

### Query: 29a.sql

**Tables:**
- aka_name AS an
- cast_info AS ci
- char_name AS chn
- comp_cast_type AS cct1
- comp_cast_type AS cct2
- company_name AS cn
- complete_cast AS cc
- info_type AS it
- info_type AS it3
- keyword AS k
- movie_companies AS mc
- movie_info AS mi
- movie_keyword AS mk
- name AS n
- person_info AS pi
- role_type AS rt
- title AS t

**Join Conditions:**
- t.id = mi.movie_id
- t.id = mc.movie_id
- t.id = ci.movie_id
- t.id = mk.movie_id
- t.id = cc.movie_id
- mc.movie_id = ci.movie_id
- mc.movie_id = mi.movie_id
- mc.movie_id = mk.movie_id
- mc.movie_id = cc.movie_id
- mi.movie_id = ci.movie_id
- mi.movie_id = mk.movie_id
- mi.movie_id = cc.movie_id
- ci.movie_id = mk.movie_id
- ci.movie_id = cc.movie_id
- mk.movie_id = cc.movie_id
- cn.id = mc.company_id
- it.id = mi.info_type_id
- n.id = ci.person_id
- rt.id = ci.role_id
- n.id = an.person_id
- ci.person_id = an.person_id
- chn.id = ci.person_role_id
- n.id = pi.person_id
- ci.person_id = pi.person_id
- it3.id = pi.info_type_id
- k.id = mk.keyword_id
- cct1.id = cc.subject_id
- cct2.id = cc.status_id

**Equivalence Classes:**
- Class 1: {cc.subject_id, cct1.id}
- Class 2: {cc.movie_id, ci.movie_id, mc.movie_id, mi.movie_id, mk.movie_id, t.id}
- Class 3: {it3.id, pi.info_type_id}
- Class 4: {k.id, mk.keyword_id}
- Class 5: {ci.role_id, rt.id}
- Class 6: {an.person_id, ci.person_id, n.id, pi.person_id}
- Class 7: {cc.status_id, cct2.id}
- Class 8: {cn.id, mc.company_id}
- Class 9: {chn.id, ci.person_role_id}
- Class 10: {it.id, mi.info_type_id}

**Hypergraph:**
- Nodes (tables): {an, cc, cct1, cct2, chn, ci, cn, it, it3, k, mc, mi, mk, n, pi, rt, t}
- Hyperedges:
  - Edge 1: Tables {cc, cct1} via attributes {cc.subject_id, cct1.id}
  - Edge 2: Tables {cc, ci, mc, mi, mk, t} via attributes {cc.movie_id, ci.movie_id, mc.movie_id, mi.movie_id, mk.movie_id, t.id}
  - Edge 3: Tables {it3, pi} via attributes {it3.id, pi.info_type_id}
  - Edge 4: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 5: Tables {ci, rt} via attributes {ci.role_id, rt.id}
  - Edge 6: Tables {an, ci, n, pi} via attributes {an.person_id, ci.person_id, n.id, pi.person_id}
  - Edge 7: Tables {cc, cct2} via attributes {cc.status_id, cct2.id}
  - Edge 8: Tables {cn, mc} via attributes {cn.id, mc.company_id}
  - Edge 9: Tables {chn, ci} via attributes {chn.id, ci.person_role_id}
  - Edge 10: Tables {it, mi} via attributes {it.id, mi.info_type_id}

---

### Query: 2a.sql

**Tables:**
- company_name AS cn
- keyword AS k
- movie_companies AS mc
- movie_keyword AS mk
- title AS t

**Join Conditions:**
- cn.id = mc.company_id
- mc.movie_id = t.id
- t.id = mk.movie_id
- mk.keyword_id = k.id
- mc.movie_id = mk.movie_id

**Equivalence Classes:**
- Class 1: {k.id, mk.keyword_id}
- Class 2: {mc.movie_id, mk.movie_id, t.id}
- Class 3: {cn.id, mc.company_id}

**Hypergraph:**
- Nodes (tables): {cn, k, mc, mk, t}
- Hyperedges:
  - Edge 1: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 2: Tables {mc, mk, t} via attributes {mc.movie_id, mk.movie_id, t.id}
  - Edge 3: Tables {cn, mc} via attributes {cn.id, mc.company_id}

---

### Query: 30a.sql

**Tables:**
- cast_info AS ci
- comp_cast_type AS cct1
- comp_cast_type AS cct2
- complete_cast AS cc
- info_type AS it1
- info_type AS it2
- keyword AS k
- movie_info AS mi
- movie_info_idx AS mi_idx
- movie_keyword AS mk
- name AS n
- title AS t

**Join Conditions:**
- t.id = mi.movie_id
- t.id = mi_idx.movie_id
- t.id = ci.movie_id
- t.id = mk.movie_id
- t.id = cc.movie_id
- ci.movie_id = mi.movie_id
- ci.movie_id = mi_idx.movie_id
- ci.movie_id = mk.movie_id
- ci.movie_id = cc.movie_id
- mi.movie_id = mi_idx.movie_id
- mi.movie_id = mk.movie_id
- mi.movie_id = cc.movie_id
- mi_idx.movie_id = mk.movie_id
- mi_idx.movie_id = cc.movie_id
- mk.movie_id = cc.movie_id
- n.id = ci.person_id
- it1.id = mi.info_type_id
- it2.id = mi_idx.info_type_id
- k.id = mk.keyword_id
- cct1.id = cc.subject_id
- cct2.id = cc.status_id

**Equivalence Classes:**
- Class 1: {ci.person_id, n.id}
- Class 2: {it1.id, mi.info_type_id}
- Class 3: {k.id, mk.keyword_id}
- Class 4: {cc.movie_id, ci.movie_id, mi.movie_id, mi_idx.movie_id, mk.movie_id, t.id}
- Class 5: {it2.id, mi_idx.info_type_id}
- Class 6: {cc.subject_id, cct1.id}
- Class 7: {cc.status_id, cct2.id}

**Hypergraph:**
- Nodes (tables): {cc, cct1, cct2, ci, it1, it2, k, mi, mi_idx, mk, n, t}
- Hyperedges:
  - Edge 1: Tables {ci, n} via attributes {ci.person_id, n.id}
  - Edge 2: Tables {it1, mi} via attributes {it1.id, mi.info_type_id}
  - Edge 3: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 4: Tables {cc, ci, mi, mi_idx, mk, t} via attributes {cc.movie_id, ci.movie_id, mi.movie_id, mi_idx.movie_id, mk.movie_id, t.id}
  - Edge 5: Tables {it2, mi_idx} via attributes {it2.id, mi_idx.info_type_id}
  - Edge 6: Tables {cc, cct1} via attributes {cc.subject_id, cct1.id}
  - Edge 7: Tables {cc, cct2} via attributes {cc.status_id, cct2.id}

---

### Query: 31a.sql

**Tables:**
- cast_info AS ci
- company_name AS cn
- info_type AS it1
- info_type AS it2
- keyword AS k
- movie_companies AS mc
- movie_info AS mi
- movie_info_idx AS mi_idx
- movie_keyword AS mk
- name AS n
- title AS t

**Join Conditions:**
- t.id = mi.movie_id
- t.id = mi_idx.movie_id
- t.id = ci.movie_id
- t.id = mk.movie_id
- t.id = mc.movie_id
- ci.movie_id = mi.movie_id
- ci.movie_id = mi_idx.movie_id
- ci.movie_id = mk.movie_id
- ci.movie_id = mc.movie_id
- mi.movie_id = mi_idx.movie_id
- mi.movie_id = mk.movie_id
- mi.movie_id = mc.movie_id
- mi_idx.movie_id = mk.movie_id
- mi_idx.movie_id = mc.movie_id
- mk.movie_id = mc.movie_id
- n.id = ci.person_id
- it1.id = mi.info_type_id
- it2.id = mi_idx.info_type_id
- k.id = mk.keyword_id
- cn.id = mc.company_id

**Equivalence Classes:**
- Class 1: {ci.person_id, n.id}
- Class 2: {it1.id, mi.info_type_id}
- Class 3: {k.id, mk.keyword_id}
- Class 4: {ci.movie_id, mc.movie_id, mi.movie_id, mi_idx.movie_id, mk.movie_id, t.id}
- Class 5: {it2.id, mi_idx.info_type_id}
- Class 6: {cn.id, mc.company_id}

**Hypergraph:**
- Nodes (tables): {ci, cn, it1, it2, k, mc, mi, mi_idx, mk, n, t}
- Hyperedges:
  - Edge 1: Tables {ci, n} via attributes {ci.person_id, n.id}
  - Edge 2: Tables {it1, mi} via attributes {it1.id, mi.info_type_id}
  - Edge 3: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 4: Tables {ci, mc, mi, mi_idx, mk, t} via attributes {ci.movie_id, mc.movie_id, mi.movie_id, mi_idx.movie_id, mk.movie_id, t.id}
  - Edge 5: Tables {it2, mi_idx} via attributes {it2.id, mi_idx.info_type_id}
  - Edge 6: Tables {cn, mc} via attributes {cn.id, mc.company_id}

---

### Query: 32a.sql

**Tables:**
- keyword AS k
- link_type AS lt
- movie_keyword AS mk
- movie_link AS ml
- title AS t1
- title AS t2

**Join Conditions:**
- mk.keyword_id = k.id
- t1.id = mk.movie_id
- ml.movie_id = t1.id
- ml.linked_movie_id = t2.id
- lt.id = ml.link_type_id
- mk.movie_id = t1.id

**Equivalence Classes:**
- Class 1: {lt.id, ml.link_type_id}
- Class 2: {k.id, mk.keyword_id}
- Class 3: {mk.movie_id, ml.movie_id, t1.id}
- Class 4: {ml.linked_movie_id, t2.id}

**Hypergraph:**
- Nodes (tables): {k, lt, mk, ml, t1, t2}
- Hyperedges:
  - Edge 1: Tables {lt, ml} via attributes {lt.id, ml.link_type_id}
  - Edge 2: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 3: Tables {mk, ml, t1} via attributes {mk.movie_id, ml.movie_id, t1.id}
  - Edge 4: Tables {ml, t2} via attributes {ml.linked_movie_id, t2.id}

---

### Query: 33a.sql

**Tables:**
- company_name AS cn1
- company_name AS cn2
- info_type AS it1
- info_type AS it2
- kind_type AS kt1
- kind_type AS kt2
- link_type AS lt
- movie_companies AS mc1
- movie_companies AS mc2
- movie_info_idx AS mi_idx1
- movie_info_idx AS mi_idx2
- movie_link AS ml
- title AS t1
- title AS t2

**Join Conditions:**
- lt.id = ml.link_type_id
- t1.id = ml.movie_id
- t2.id = ml.linked_movie_id
- it1.id = mi_idx1.info_type_id
- t1.id = mi_idx1.movie_id
- kt1.id = t1.kind_id
- cn1.id = mc1.company_id
- t1.id = mc1.movie_id
- ml.movie_id = mi_idx1.movie_id
- ml.movie_id = mc1.movie_id
- mi_idx1.movie_id = mc1.movie_id
- it2.id = mi_idx2.info_type_id
- t2.id = mi_idx2.movie_id
- kt2.id = t2.kind_id
- cn2.id = mc2.company_id
- t2.id = mc2.movie_id
- ml.linked_movie_id = mi_idx2.movie_id
- ml.linked_movie_id = mc2.movie_id
- mi_idx2.movie_id = mc2.movie_id

**Equivalence Classes:**
- Class 1: {lt.id, ml.link_type_id}
- Class 2: {mc1.movie_id, mi_idx1.movie_id, ml.movie_id, t1.id}
- Class 3: {it2.id, mi_idx2.info_type_id}
- Class 4: {kt2.id, t2.kind_id}
- Class 5: {cn2.id, mc2.company_id}
- Class 6: {it1.id, mi_idx1.info_type_id}
- Class 7: {kt1.id, t1.kind_id}
- Class 8: {mc2.movie_id, mi_idx2.movie_id, ml.linked_movie_id, t2.id}
- Class 9: {cn1.id, mc1.company_id}

**Hypergraph:**
- Nodes (tables): {cn1, cn2, it1, it2, kt1, kt2, lt, mc1, mc2, mi_idx1, mi_idx2, ml, t1, t2}
- Hyperedges:
  - Edge 1: Tables {lt, ml} via attributes {lt.id, ml.link_type_id}
  - Edge 2: Tables {mc1, mi_idx1, ml, t1} via attributes {mc1.movie_id, mi_idx1.movie_id, ml.movie_id, t1.id}
  - Edge 3: Tables {it2, mi_idx2} via attributes {it2.id, mi_idx2.info_type_id}
  - Edge 4: Tables {kt2, t2} via attributes {kt2.id, t2.kind_id}
  - Edge 5: Tables {cn2, mc2} via attributes {cn2.id, mc2.company_id}
  - Edge 6: Tables {it1, mi_idx1} via attributes {it1.id, mi_idx1.info_type_id}
  - Edge 7: Tables {kt1, t1} via attributes {kt1.id, t1.kind_id}
  - Edge 8: Tables {mc2, mi_idx2, ml, t2} via attributes {mc2.movie_id, mi_idx2.movie_id, ml.linked_movie_id, t2.id}
  - Edge 9: Tables {cn1, mc1} via attributes {cn1.id, mc1.company_id}

---

### Query: 3a.sql

**Tables:**
- keyword AS k
- movie_info AS mi
- movie_keyword AS mk
- title AS t

**Join Conditions:**
- t.id = mi.movie_id
- t.id = mk.movie_id
- mk.movie_id = mi.movie_id
- k.id = mk.keyword_id

**Equivalence Classes:**
- Class 1: {k.id, mk.keyword_id}
- Class 2: {mi.movie_id, mk.movie_id, t.id}

**Hypergraph:**
- Nodes (tables): {k, mi, mk, t}
- Hyperedges:
  - Edge 1: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 2: Tables {mi, mk, t} via attributes {mi.movie_id, mk.movie_id, t.id}

---

### Query: 4a.sql

**Tables:**
- info_type AS it
- keyword AS k
- movie_info_idx AS mi_idx
- movie_keyword AS mk
- title AS t

**Join Conditions:**
- t.id = mi_idx.movie_id
- t.id = mk.movie_id
- mk.movie_id = mi_idx.movie_id
- k.id = mk.keyword_id
- it.id = mi_idx.info_type_id

**Equivalence Classes:**
- Class 1: {k.id, mk.keyword_id}
- Class 2: {mi_idx.movie_id, mk.movie_id, t.id}
- Class 3: {it.id, mi_idx.info_type_id}

**Hypergraph:**
- Nodes (tables): {it, k, mi_idx, mk, t}
- Hyperedges:
  - Edge 1: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 2: Tables {mi_idx, mk, t} via attributes {mi_idx.movie_id, mk.movie_id, t.id}
  - Edge 3: Tables {it, mi_idx} via attributes {it.id, mi_idx.info_type_id}

---

### Query: 5a.sql

**Tables:**
- company_type AS ct
- info_type AS it
- movie_companies AS mc
- movie_info AS mi
- title AS t

**Join Conditions:**
- t.id = mi.movie_id
- t.id = mc.movie_id
- mc.movie_id = mi.movie_id
- ct.id = mc.company_type_id
- it.id = mi.info_type_id

**Equivalence Classes:**
- Class 1: {it.id, mi.info_type_id}
- Class 2: {mc.movie_id, mi.movie_id, t.id}
- Class 3: {ct.id, mc.company_type_id}

**Hypergraph:**
- Nodes (tables): {ct, it, mc, mi, t}
- Hyperedges:
  - Edge 1: Tables {it, mi} via attributes {it.id, mi.info_type_id}
  - Edge 2: Tables {mc, mi, t} via attributes {mc.movie_id, mi.movie_id, t.id}
  - Edge 3: Tables {ct, mc} via attributes {ct.id, mc.company_type_id}

---

### Query: 6a.sql

**Tables:**
- cast_info AS ci
- keyword AS k
- movie_keyword AS mk
- name AS n
- title AS t

**Join Conditions:**
- k.id = mk.keyword_id
- t.id = mk.movie_id
- t.id = ci.movie_id
- ci.movie_id = mk.movie_id
- n.id = ci.person_id

**Equivalence Classes:**
- Class 1: {k.id, mk.keyword_id}
- Class 2: {ci.person_id, n.id}
- Class 3: {ci.movie_id, mk.movie_id, t.id}

**Hypergraph:**
- Nodes (tables): {ci, k, mk, n, t}
- Hyperedges:
  - Edge 1: Tables {k, mk} via attributes {k.id, mk.keyword_id}
  - Edge 2: Tables {ci, n} via attributes {ci.person_id, n.id}
  - Edge 3: Tables {ci, mk, t} via attributes {ci.movie_id, mk.movie_id, t.id}

---

### Query: 7a.sql

**Tables:**
- aka_name AS an
- cast_info AS ci
- info_type AS it
- link_type AS lt
- movie_link AS ml
- name AS n
- person_info AS pi
- title AS t

**Join Conditions:**
- n.id = an.person_id
- n.id = pi.person_id
- ci.person_id = n.id
- t.id = ci.movie_id
- ml.linked_movie_id = t.id
- lt.id = ml.link_type_id
- it.id = pi.info_type_id
- pi.person_id = an.person_id
- pi.person_id = ci.person_id
- an.person_id = ci.person_id
- ci.movie_id = ml.linked_movie_id

**Equivalence Classes:**
- Class 1: {lt.id, ml.link_type_id}
- Class 2: {an.person_id, ci.person_id, n.id, pi.person_id}
- Class 3: {ci.movie_id, ml.linked_movie_id, t.id}
- Class 4: {it.id, pi.info_type_id}

**Hypergraph:**
- Nodes (tables): {an, ci, it, lt, ml, n, pi, t}
- Hyperedges:
  - Edge 1: Tables {lt, ml} via attributes {lt.id, ml.link_type_id}
  - Edge 2: Tables {an, ci, n, pi} via attributes {an.person_id, ci.person_id, n.id, pi.person_id}
  - Edge 3: Tables {ci, ml, t} via attributes {ci.movie_id, ml.linked_movie_id, t.id}
  - Edge 4: Tables {it, pi} via attributes {it.id, pi.info_type_id}

---

### Query: 8a.sql

**Tables:**
- aka_name AS an1
- cast_info AS ci
- company_name AS cn
- movie_companies AS mc
- name AS n1
- role_type AS rt
- title AS t

**Join Conditions:**
- an1.person_id = n1.id
- n1.id = ci.person_id
- ci.movie_id = t.id
- t.id = mc.movie_id
- mc.company_id = cn.id
- ci.role_id = rt.id
- an1.person_id = ci.person_id
- ci.movie_id = mc.movie_id

**Equivalence Classes:**
- Class 1: {ci.role_id, rt.id}
- Class 2: {an1.person_id, ci.person_id, n1.id}
- Class 3: {ci.movie_id, mc.movie_id, t.id}
- Class 4: {cn.id, mc.company_id}

**Hypergraph:**
- Nodes (tables): {an1, ci, cn, mc, n1, rt, t}
- Hyperedges:
  - Edge 1: Tables {ci, rt} via attributes {ci.role_id, rt.id}
  - Edge 2: Tables {an1, ci, n1} via attributes {an1.person_id, ci.person_id, n1.id}
  - Edge 3: Tables {ci, mc, t} via attributes {ci.movie_id, mc.movie_id, t.id}
  - Edge 4: Tables {cn, mc} via attributes {cn.id, mc.company_id}

---

### Query: 9a.sql

**Tables:**
- aka_name AS an
- cast_info AS ci
- char_name AS chn
- company_name AS cn
- movie_companies AS mc
- name AS n
- role_type AS rt
- title AS t

**Join Conditions:**
- ci.movie_id = t.id
- t.id = mc.movie_id
- ci.movie_id = mc.movie_id
- mc.company_id = cn.id
- ci.role_id = rt.id
- n.id = ci.person_id
- chn.id = ci.person_role_id
- an.person_id = n.id
- an.person_id = ci.person_id

**Equivalence Classes:**
- Class 1: {ci.role_id, rt.id}
- Class 2: {an.person_id, ci.person_id, n.id}
- Class 3: {ci.movie_id, mc.movie_id, t.id}
- Class 4: {chn.id, ci.person_role_id}
- Class 5: {cn.id, mc.company_id}

**Hypergraph:**
- Nodes (tables): {an, chn, ci, cn, mc, n, rt, t}
- Hyperedges:
  - Edge 1: Tables {ci, rt} via attributes {ci.role_id, rt.id}
  - Edge 2: Tables {an, ci, n} via attributes {an.person_id, ci.person_id, n.id}
  - Edge 3: Tables {ci, mc, t} via attributes {ci.movie_id, mc.movie_id, t.id}
  - Edge 4: Tables {chn, ci} via attributes {chn.id, ci.person_role_id}
  - Edge 5: Tables {cn, mc} via attributes {cn.id, mc.company_id}

---

