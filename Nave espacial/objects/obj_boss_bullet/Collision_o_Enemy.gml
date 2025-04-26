if other.hp > 0 {
	scrDamage_entity(other, self, damage, knockback_time, knockback);
	bullet_destroy();
}