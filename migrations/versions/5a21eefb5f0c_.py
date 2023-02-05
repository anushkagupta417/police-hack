"""empty message

Revision ID: 5a21eefb5f0c
Revises: 9dbc3cbcf0d2
Create Date: 2023-02-03 00:16:22.929298

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '5a21eefb5f0c'
down_revision = '9dbc3cbcf0d2'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('user', schema=None) as batch_op:
        batch_op.alter_column('designation',
               existing_type=sa.VARCHAR(length=24),
               type_=sa.String(length=25),
               existing_nullable=True)

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('user', schema=None) as batch_op:
        batch_op.alter_column('designation',
               existing_type=sa.String(length=25),
               type_=sa.VARCHAR(length=24),
               existing_nullable=True)

    # ### end Alembic commands ###