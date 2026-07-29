import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CrystallographyChemistryStructureSolutionDirectCanonicalLaneLean

structure SpaceGroupClassificationPackage where
  pointGroup : Type u
  latticeSystem : Type v
  centeringType : Type w
  spaceGroupSymbol : String
  symmorphic : Prop
  generatorList : List String
  spaceGroupNumber : Nat

structure SpaceGroupClassificationEvidence (C : SpaceGroupClassificationPackage) where
  pointGroupDetermined : C.pointGroup ≠ Empty
  latticeSystemDetermined : C.latticeSystem ≠ Empty
  centeringDetermined : C.centeringType ≠ Empty
  symmorphicClosed : C.symmorphic
  spaceGroupNumberClosed : C.spaceGroupNumber > 0

def SpaceGroupClassificationClosed (C : SpaceGroupClassificationPackage) : Prop :=
  C.pointGroup ≠ Empty ∧
  C.latticeSystem ≠ Empty ∧
  C.centeringType ≠ Empty ∧
  C.symmorphic ∧
  C.spaceGroupNumber > 0

theorem space_group_classification_closed_from_evidence
    (C : SpaceGroupClassificationPackage) (E : SpaceGroupClassificationEvidence C) :
    SpaceGroupClassificationClosed C := by
  exact And.intro E.pointGroupDetermined
    (And.intro E.latticeSystemDetermined
      (And.intro E.centeringDetermined
        (And.intro E.symmorphicClosed E.spaceGroupNumberClosed)))

end CrystallographyChemistryStructureSolutionDirectCanonicalLaneLean
end HautevilleHouse
