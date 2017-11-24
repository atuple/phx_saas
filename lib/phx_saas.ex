defmodule PhxSaas do
  alias Ecto.Changeset
  import PhxSaas.PrefixBuilder

  defdelegate drop_tenant(repo, tenant), to: PhxSaas.TenantActions
  defdelegate migrate_tenant(repo, tenant, direction \\ :up, opts \\ []), to: PhxSaas.TenantActions
  defdelegate new_tenant(repo, tenant), to: PhxSaas.TenantActions

  def all(repo, queryable, tenant, opts \\ []) when is_list(opts) do
    queryable
    |> add_prefix_to_query(tenant)
    |> repo.all(opts)
  end

  @doc """
  Implementation for `PhxSaas.get/5`
  """
  def get(repo, queryable, id, tenant, opts \\ []) do
    queryable
    |> add_prefix_to_query(tenant)
    |> repo.get(id, opts)
  end

  @doc """
  Implementation for `PhxSaas.get!/5`
  """
  def get!(repo, queryable, id, tenant, opts \\ []) do
    queryable
    |> add_prefix_to_query(tenant)
    |> repo.get!(id, opts)
  end

  def get_by(repo, queryable, clauses, tenant, opts \\ []) do
    queryable
    |> add_prefix_to_query(tenant)
    |> repo.get_by(clauses, opts)
  end

  def get_by!(repo, queryable, clauses, tenant, opts \\ []) do
    queryable
    |> add_prefix_to_query(tenant)
    |> repo.get_by!(clauses, opts)
  end

  @doc """
  Implementation for `PhxSaas.one/4`
  """
  def one(repo, queryable, tenant, opts \\ []) do
    queryable
    |> add_prefix_to_query(tenant)
    |> repo.one(opts)
  end

  @doc """
  Implementation for `PhxSaas.one!/4`
  """
  def one!(repo, queryable, tenant, opts \\ []) do
    queryable
    |> add_prefix_to_query(tenant)
    |> repo.one!(opts)
  end

  #model derived functions

   @doc """
  Implementation for `PhxSaas.insert/4`.
  """
  def insert(repo, model_or_changeset, tenant, opts \\ []) do
    model_or_changeset
    |> add_prefix(tenant)
    |> repo.insert(opts)
  end

  def insert!(repo, model_or_changeset, tenant, opts \\ []) do
    model_or_changeset
    |> add_prefix(tenant)
    |> repo.insert!(opts)
  end

  @doc """
  Implementation for `PhxSaas.update!/4`.
  """
  def update(repo, model_or_changeset, tenant, opts \\ []) do
    model_or_changeset
    |> add_prefix(tenant)
    |> repo.update(opts)
  end

  def update!(repo, model_or_changeset, tenant, opts \\ []) do
    model_or_changeset
    |> add_prefix(tenant)
    |> repo.update!(opts)
  end

  @doc """
  Runtime callback for `PhxSaas.update_all/5`
  """
  def update_all(repo, queryable, updates, tenant, opts \\ []) do
    queryable
    |> add_prefix_to_query(tenant)
    |> repo.update_all(updates, opts)
  end

  @doc """
  Implementation for `PhxSaas.insert_or_update/4`.
  """
  def insert_or_update(repo, model_or_changeset, tenant, opts \\ []) do
    model_or_changeset
    |> add_prefix(tenant)
    |> repo.insert_or_update(opts)
  end

  @doc """
  Implementation for `PhxSaas.insert_or_update!/4`.
  """
  def insert_or_update!(repo, model_or_changeset, tenant, opts \\ []) do
    model_or_changeset
    |> add_prefix(tenant)
    |> repo.insert_or_update!(opts)
  end

  @doc """
  Implementation for `PhxSaas.delete/4`.
  """
  def delete(repo, model_or_changeset, tenant, opts \\ []) do
    model_or_changeset
    |> add_prefix(tenant)
    |> repo.delete(opts)
  end

  @doc """
  Implementation for `PhxSaas.delete!/4`.
  """
  def delete!(repo, model_or_changeset, tenant, opts \\ []) do
    model_or_changeset
    |> add_prefix(tenant)
    |> repo.delete!(opts)
  end

  @doc """
  Implementation for `PhxSaas.delete_all/4`
  """
  def delete_all(repo, queryable, tenant, opts \\ []) do
    queryable
    |> add_prefix_to_query(tenant)
    |> repo.delete_all(opts)
  end

  #helpers

  defp add_prefix(%Changeset{} = changeset, tenant) do
    %{changeset | data: add_prefix(changeset.data, tenant)}
  end

  defp add_prefix(%{__struct__: _} = model, tenant) do
    Ecto.put_meta(model,  prefix: build_prefix(tenant))
  end

  defp add_prefix_to_query(queryable, tenant) do
    queryable
    |> Ecto.Queryable.to_query()
    |> Map.put(:prefix, build_prefix(tenant))
  end
end
